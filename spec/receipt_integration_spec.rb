require 'order'
require 'menu'
require 'dish'
require 'receipt'

RSpec.describe "receipt integration" do 
  describe "total_price method" do  
    it "returns total price" do 
      menu_1 = Menu.new
      dish_1 = Dish.new("Cod", 10.49)
      dish_2 = Dish.new("Chips", 3.99)
      dish_3 = Dish.new("Haddock", 7.00)
      menu_1.menu_add(dish_1)
      menu_1.menu_add(dish_2)
      menu_1.menu_add(dish_3)
      order_1 = Order.new(menu_1)
      order_1.order_add(dish_1)
      order_1.order_add(dish_2)
      order_1.order_add(dish_2)
      receipt_1 = Receipt.new(order_1)
      expect(receipt_1.total_price).to eq 18.47
    end
  end

  describe "receipt_formatter method" do 
    it "returns receipt string of ordered dishes when submitted" do 
      menu_1 = Menu.new
      dish_1 = Dish.new("Cod", 10.49)
      dish_2 = Dish.new("Chips", 3.99)
      dish_3 = Dish.new("Haddock", 7.00)
      menu_1.menu_add(dish_1)
      menu_1.menu_add(dish_2)
      menu_1.menu_add(dish_3)
      order_1 = Order.new(menu_1)
      order_1.order_add(dish_1)
      order_1.order_add(dish_2)
      order_1.order_add(dish_2)
      order_1.submit_order
      receipt_1 = Receipt.new(order_1)
      expect(receipt_1.receipt_formatter).to eq "Items\n* Cod: £10.49\n* Chips: £3.99\n* Chips: £3.99\n\nTotal Price: £18.47"
    end 
  end

  context "returns error" do 
    it "when order not submitted" do 
      menu_1 = Menu.new
      order_1 = Order.new(menu_1)
      receipt_1 = Receipt.new(order_1)
      expect { receipt_1.receipt_formatter }.to raise_error "Error - Order not submitted"
    end
  end

end