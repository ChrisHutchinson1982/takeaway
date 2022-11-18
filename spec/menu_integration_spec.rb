require 'menu'
require 'dish'

RSpec.describe "menu integration" do
  it "returns list of menu dishes" do
    menu_1 = Menu.new
    dish_1 = Dish.new("Cod", 10.49)
    dish_2 = Dish.new("Chips", 3.99)
    dish_3 = Dish.new("Haddock", 7.00)
    menu_1.menu_add(dish_1)
    menu_1.menu_add(dish_2)
    menu_1.menu_add(dish_3)
    expect(menu_1.menu_list).to eq [dish_1, dish_2, dish_3]
  end
  it "returns error if dish already added to menu" do
    menu_1 = Menu.new
    dish_1 = Dish.new("Cod", 10.49)
    menu_1.menu_add(dish_1)
    expect { menu_1.menu_add(dish_1) }.to raise_error "Error - Dish already added to menu"
  end
end