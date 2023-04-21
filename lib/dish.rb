class Dish
  def initialize(name, price) # name is a String, price is a Float
    fail "name should be a string" unless name.is_a? String
    fail "price should be a number" unless price.is_a? Numeric
    @name = name
    @price = price
  end

  def name
    @name
  end

  def price
    @price
  end
end