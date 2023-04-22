class Menu
  def initialize
    @menu_items = []
  end

  def list
    @menu_items
  end

  def add_dish(dish)
    @menu_items << dish
  end
end