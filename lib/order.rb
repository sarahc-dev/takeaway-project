class Order
  def initialize(menu) 
    @menu = menu
    @order = []
  end

  def add(dish, amount)
    fail "amount should be an integer" unless amount.is_a? Integer
    fail "chosen dish is not on the menu" unless @menu.list.include? dish
    amount.times { @order << dish }
  end

  def items_in_order
      @order
  end

  def total
      @order.map { |item| item.price }.sum
  end
end