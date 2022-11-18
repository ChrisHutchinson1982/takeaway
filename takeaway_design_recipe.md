# Takeaway Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._


> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.
> 
> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
> 
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.

Use the `twilio-ruby` gem to implement this next one. You will need to use
doubles too.

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and
> will be delivered before 18:52" after I have ordered.


## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```


```

_Also design the interface of each class in more detail._

```ruby
class Menu
  def initialize
    # menu is an array
  end

  def menu_add(dish) # dish is an instance of Dish
    # dish gets added to the menu library
    # Returns nothing

    # fail if dish hs already been added
  end

  def menu_list
    # Returns a list of dish objects
  end

end

class Dish
  def initialize(dish, price) # dish is a string and price is a 2dp float
  end

  def dish
    # Returns a string
  end

  def price
    # Returns a float
  end

  def text_formatter
    # Returns string of *#{dish}: *#{price}
  end

end

class Order
  def initialize(menu)  # menu is an instance of Menu
    # order is an array
    # submit is a boolean
  end

  def order_add(dish) # dish is an instance of Dish
    # dish gets added to the order library
    # Returns nothing

    # fail if dish is not in menu
    # fail if submitted? is true
  end

  def order_list
    # Returns a list of dish objects
  end

  def submit_order
    # makes submitted? true
    # Returns nothing 
  end

  def submitted?  
    # Returns
  end 
end


class Receipt
  def initialize(order) # order is an instance of Order
   # ...
  end

  def total_price
    # returns total price as float
  end

  def receipt_formatter
    # returns a string of order with total_price
    # fail if submitted? is false
  end
end

class text
  def initialize(order) # order is an instance of Order
   # ...
  end

  def send(phone_number, time) # phone_number is a strng and time is a 2dp float
    # send text "Thank you! Your order was placed and
>   # will be delivered before #{time}"
    # fail if phone_number is not valid format
    # fail if submitted? is false
    # returns confirmation is has been sent and received?
  end

end



```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

# list of menu dishes with prices
menu_1 = Menu.new
dish_1 = Dish.new("Cod", 10.49)
dish_2 = Dish.new("Chips", 3.99)
dish_3 = Dish.new("Haddock", 7.00)
menu_1.menu_add(dish_1)
menu_1.menu_add(dish_2)
menu_1.menu_add(dish_3)
expect(menu_1.menu_list).to eq [dish_1, dish_2, dish_3]


# returns error if dish already added to menu
menu_1 = Menu.new
dish_1 = Dish.new("Cod", 10.49)
menu_1.menu_add(dish_1)
menu_1.menu_add(dish_1)
expect {menu_1.menu_list}.to raise_error "Error - Dish already added to menu"

# list of order dishes with prices
menu_1 = Menu.new
dish_1 = Dish.new("Cod", 10.49)
dish_2 = Dish.new("Chips", 3.99)
dish_3 = Dish.new("Haddock", 7.00)
menu_1.menu_add(dish_1)
menu_2.menu_add(dish_2)
menu_3.menu_add(dish_3)
order_1 = Order.new(menu_1)
order_1.order_add(dish_1)
order_1.order_add(dish_2)
order_1.order_add(dish_2)
expect(order_1.order_list).to eq [dish_1, dish_2, dish_2]

# returns error if dish not included in menu
menu_1 = Menu.new
dish_1 = Dish.new("Cod", 10.49)
dish_2 = Dish.new("Chips", 3.99)
menu_1.menu_add(dish_1)
order_1 = Order.new(menu_1)
order_1.order_add(dish_2)
expect { order_1.order_list }.to raise_error "Error - Dish not included in menu"

# returns true if order has been submutited
menu_1 = Menu.new
dish_1 = Dish.new("Cod", 10.49)
menu_1.menu_add(dish_1)
order_1 = Order.new(menu_1)
order_1.order_add(dish_1)
order_1.submit_order
expect(order_1.submitted?).to eq true

# returns false if order has not been submutited
menu_1 = Menu.new
dish_1 = Dish.new("Cod", 10.49)
menu_1.menu_add(dish_1)
order_1 = Order.new(menu_1)
order_1.order_add(dish_1)
expect(order_1.submitted?).to eq false

# returns error if order has no dishes
menu_1 = Menu.new
order_1 = Order.new(menu_1)
order_1.submit_order
expect { order_1.submit_order }.to raise_error "Error - No dishes added to order"

# returns total price
menu_1 = Menu.new
dish_1 = Dish.new("Cod", 10.49)
dish_2 = Dish.new("Chips", 3.99)
dish_3 = Dish.new("Haddock", 7.00)
menu_1.menu_add(dish_1)
menu_2.menu_add(dish_2)
menu_3.menu_add(dish_3)
order_1 = Order.new(menu_1)
order_1.order_add(dish_1)
order_1.order_add(dish_2)
order_1.order_add(dish_2)
receipt_1 = Receipt.new(order_1)
expect(receipt_1.total_price).to eq 18.47


# returns receipt string of ordered dishes when submitted
menu_1 = Menu.new
dish_1 = Dish.new("Cod", 10.49)
dish_2 = Dish.new("Chips", 3.99)
dish_3 = Dish.new("Haddock", 7.00)
menu_1.menu_add(dish_1)
menu_2.menu_add(dish_2)
menu_3.menu_add(dish_3)
order_1 = Order.new(menu_1)
order_1.order_add(dish_1)
order_1.order_add(dish_2)
order_1.order_add(dish_2)
order_1.submit_order
receipt_1 = Receipt.new(order_1)
expect(receipt_1.receipt_formatter).to eq "Items\n
                                          * Cod: £10.49\n
                                          * Chips: £3.99\n
                                          * Chips: £3.99\n
                                          \n
                                          Total Price: £18.47"
                                          

# returns receipt error when not submitted
menu_1 = Menu.new
order_1 = Order.new(menu_1)
order_1.submit_order
receipt_1 = Receipt.new(order_1)
expect { receipt_1.receipt_formatter }.to raise_error "Error - Order not submitted"


# Use the `twilio-ruby` gem to implement this next one. You will need to use
# doubles too.

# > As a customer  
# > So that I am reassured that my order will be delivered on time  
# > I would like to receive a text such as "Thank you! Your order was placed and
# > will be delivered before 18:52" after I have ordered.

```





## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


