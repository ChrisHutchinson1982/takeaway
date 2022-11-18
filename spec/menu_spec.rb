require 'menu'

RSpec.describe Menu do 
  it "contructs" do
    menu_1 = Menu.new
    expect(menu_1.menu_list).to eq []
  end
  it "returns list of menu dishes" do
    menu_1 = Menu.new
    fake_dish1 = double(:fake_dish)
    fake_dish2 = double(:fake_dish)
    fake_dish3 = double(:fake_dish)
    menu_1.menu_add(fake_dish1)
    menu_1.menu_add(fake_dish2)
    menu_1.menu_add(fake_dish3)
    expect(menu_1.menu_list).to eq [fake_dish1, fake_dish2, fake_dish3]
  end
  it "returns error if dish already added to menu" do
    menu_1 = Menu.new
    fake_dish1 = double(:fake_dish)
    menu_1.menu_add(fake_dish1)
    expect { menu_1.menu_add(fake_dish1) }.to raise_error "Error - Dish already added to menu"
  end
end