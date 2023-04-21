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

  def on_menu?(dish)
    @menu_items.include? dish
  end
end