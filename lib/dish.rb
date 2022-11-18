class Dish
  def initialize(dish, price) # dish is a string and price is a 2dp float
    @dish = dish
    @price = price
  end

  def dish
    return @dish
  end

  def price
    return @price
  end

  def dish_formatter
    return "* #{@dish}: £#{@price}\n"
  end

end