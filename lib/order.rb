class Order
  def initialize(menu)
    @menu = menu
    @order = []
    @submit = false
  end

  def order_add(dish)
    fail "Error - Order already submitted" if @submit == true
    
    if @menu.menu_list.include?(dish) == true
      @order << dish
    else
      fail "Error - Dish not included in menu"
    end
    
  end

  def order_list
    return @order
  end

  def submit_order
    if @order != [] 
      @submit = true
    else
      fail "Error - No dishes added to order"
    end
  end

  def submitted?  
    return @submit
  end 
end