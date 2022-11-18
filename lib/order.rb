class Order
  def initialize(menu)
    @menu = menu
    @order = []
    @submit = false
  end

  def order_add(dish)
    fail "Error - Order already submitted" if @submit == true
    menu_dish = @menu.menu_list.include?(dish)
    fail "Error - Dish not included in menu" if menu_dish == false
    return @order << dish
  end

  def order_list
    return @order
  end

  def submit_order
    fail "Error - No dishes added to order" if @order == [] 
    return @submit = true
  end

  def submitted?  
    return @submit
  end 
end