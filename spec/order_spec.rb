require 'order'

RSpec.describe Order do
  it "contructs" do
    fake_menu_1 = double(:fake_menu)
    order_1 = Order.new(fake_menu_1)
    expect(order_1.order_list).to eq []
    expect(order_1.submitted?).to eq false
  end

  it "returns list of order dishes" do
    fake_dish_1 = double(:fake_dish)
    fake_dish_2 = double(:fake_dish)
    fake_dish_3 = double(:fake_dish)
    fake_menu_1 = double(:fake_menu, menu_list: [fake_dish_1, fake_dish_2, fake_dish_3])
    order_1 = Order.new(fake_menu_1)
    order_1.order_add(fake_dish_1)
    order_1.order_add(fake_dish_2)
    order_1.order_add(fake_dish_2)
    expect(order_1.order_list).to eq [fake_dish_1, fake_dish_2, fake_dish_2]
  end

  describe "submitted? method" do
    it "returns true if order has been submitted" do 
      fake_dish_1 = double(:fake_dish)
      fake_menu_1 = double(:fake_menu, menu_list: [fake_dish_1])
      order_1 = Order.new(fake_menu_1)
      order_1.order_add(fake_dish_1)
      order_1.submit_order
      expect(order_1.submitted?).to eq true
    end

    it "returns false if order has not been submitted" do 
      fake_dish_1 = double(:fake_dish)
      fake_menu_1 = double(:fake_menu, menu_list: [fake_dish_1])
      order_1 = Order.new(fake_menu_1)
      order_1.order_add(fake_dish_1)
      expect(order_1.submitted?).to eq false
    end
  end

  context "returns error" do 
    it "if dish not included in menu" do 
      fake_dish_1 = double(:fake_dish)
      fake_dish_2 = double(:fake_dish)
      fake_menu_1 = double(:fake_menu, menu_list: [fake_dish_1])
      order_1 = Order.new(fake_menu_1)
      expect { order_1.order_add(fake_dish_2) }.to raise_error "Error - Dish not included in menu"
    end

    it "if order has no dishes" do 
      fake_menu_1 = double(:fake_menu)
      order_1 = Order.new(fake_menu_1)
      expect { order_1.submit_order }.to raise_error "Error - No dishes added to order"
    end

    it "if order has already been submitted" do 
      fake_dish_1 = double(:fake_dish)
      fake_menu_1 = double(:fake_menu, menu_list: [fake_dish_1])
      order_1 = Order.new(fake_menu_1)
      order_1.order_add(fake_dish_1)
      order_1.submit_order
      expect { order_1.order_add(fake_dish_1) }.to raise_error "Error - Order already submitted"
    end
  end

end