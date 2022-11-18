class Receipt
  def initialize(order) 
    @order = order
  end

  def total_price
    @order.order_list.map do |dish|
      dish.price
    end.sum
  end

  def order_formatter
    @order.order_list.map do |dish|
      dish.dish_formatter
    end.join
  end

  def receipt_formatter
    fail "Error - Order not submitted" if @order.submitted? == false 
    return "Items\n#{order_formatter}\nTotal Price: £#{total_price}"
  end
end