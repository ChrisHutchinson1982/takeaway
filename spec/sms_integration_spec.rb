require 'order'
require 'menu'
require 'dish'
require 'send_sms'

RSpec.describe "receipt integration" do 
  describe "send_sms method" do  
    it "send confirmation sms" do 
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
      phone_number_1 = ENV["MY_PHONE_NUMBER"]
      delivery_time_1 = "18.30"
      sms_1 = SendSMS.new(phone_number_1, delivery_time_1)
      expect(sms_1.send_sms).to eq "SMS sent sucessfully"
    end
  end
end