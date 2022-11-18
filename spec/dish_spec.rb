require 'dish'

RSpec.describe Dish do 
  it "constructs" do 
    dish_1 = Dish.new("Cod", 10.49)
    expect(dish_1.dish).to eq "Cod"
    expect(dish_1.price).to eq 10.49
  end
  describe "dish_formatter" do
    it "returns string in correct format" do 
      dish_1 = Dish.new("Cod", 10.49)
      expect(dish_1.dish_formatter).to eq "* Cod: £10.49\n"
    end
  end
end