class Menu
  def initialize
    @menu = []
  end

  def menu_add(dish) 
    if @menu.include?(dish) == false
      @menu << dish
    else
      fail "Error - Dish already added to menu"
    end
  end

  def menu_list
    return @menu
  end
end