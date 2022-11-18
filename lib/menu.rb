class Menu
  def initialize
    @menu = []
  end

  def menu_add(dish) 
    duplicate_dish = @menu.include?(dish)
    fail "Error - Dish already added to menu" if duplicate_dish == true
    return @menu << dish
  end

  def menu_list
    return @menu
  end
end