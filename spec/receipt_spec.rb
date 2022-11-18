require 'receipt'

RSpec.describe Receipt do
  describe "total_price method" do  
    it "returns total price" do 
      fake_dish_1 = double(:fake_dish, price: 10.49)
      fake_dish_2 = double(:fake_dish, price: 3.99)
      fake_dish_3 = double(:fake_dish, price: 7.00)
      fake_order_1 = double(:fake_order, order_list: [fake_dish_1, fake_dish_2, fake_dish_2])
      receipt_1 = Receipt.new(fake_order_1)
      expect(receipt_1.total_price).to eq 18.47
    end
  end

  describe "receipt_formatter method" do 
    it "returns receipt string of ordered dishes when submitted" do 
      fake_dish_1 = double(:fake_dish, dish_formatter: "* Cod: £10.49\n", price: 10.49)
      fake_dish_2 = double(:fake_dish, dish_formatter: "* Chips: £3.99\n", price: 3.99)
      fake_dish_3 = double(:fake_dish, dish_formatter: "* Chips: £3.99\n", price: 3.99)
      fake_order_1 = double(:fake_order, order_list: [fake_dish_1, fake_dish_2, fake_dish_2], submitted?: true)
      receipt_1 = Receipt.new(fake_order_1)
      expect(receipt_1.receipt_formatter).to eq "Items\n* Cod: £10.49\n* Chips: £3.99\n* Chips: £3.99\n\nTotal Price: £18.47"
    end 
  end

  context "returns error" do 
    it "when order not submitted" do 
      fake_order_1 = double(:fake_order, submitted?: false)
      receipt_1 = Receipt.new(fake_order_1)
      expect { receipt_1.receipt_formatter }.to raise_error "Error - Order not submitted"
    end
  end

end