require 'order'
require 'menu'
require 'dish'

RSpec.describe "order integration" do

  it "returns list of order dishes" do
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
    expect(order_1.order_list).to eq [dish_1, dish_2, dish_2]
  end

  describe "submitted? method" do
    it "returns true if order has been submitted" do 
      menu_1 = Menu.new
      dish_1 = Dish.new("Cod", 10.49)
      menu_1.menu_add(dish_1)
      order_1 = Order.new(menu_1)
      order_1.order_add(dish_1)
      order_1.submit_order
      expect(order_1.submitted?).to eq true
    end

    it "returns false if order has not been submitted" do 
      menu_1 = Menu.new
      dish_1 = Dish.new("Cod", 10.49)
      menu_1.menu_add(dish_1)
      order_1 = Order.new(menu_1)
      order_1.order_add(dish_1)
      expect(order_1.submitted?).to eq false
    end
  end

  context "returns error" do 
    it "if dish not included in menu" do 
      menu_1 = Menu.new
      dish_1 = Dish.new("Cod", 10.49)
      dish_2 = Dish.new("Chips", 3.99)
      menu_1.menu_add(dish_1)
      order_1 = Order.new(menu_1)
      expect { order_1.order_add(dish_2) }.to raise_error "Error - Dish not included in menu"
    end

    it "if order has no dishes" do 
      menu_1 = Menu.new
      order_1 = Order.new(menu_1)
      expect { order_1.submit_order }.to raise_error "Error - No dishes added to order"
    end

    it "if order has already been submitted" do 
      menu_1 = Menu.new
      dish_1 = Dish.new("Cod", 10.49)
      menu_1.menu_add(dish_1)
      order_1 = Order.new(menu_1)
      order_1.order_add(dish_1)
      order_1.submit_order
      expect { order_1.order_add(dish_1) }.to raise_error "Error - Order already submitted"
    end
  end 

end