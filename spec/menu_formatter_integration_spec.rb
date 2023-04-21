require 'menu_formatter'
require 'menu'
require 'dish'

describe "MenuFormatter integration" do
    it "prints the menu with a single dish and price" do
      dish = Dish.new("pad thai", 7.5)
      menu = Menu.new
      menu.add_dish(dish)
      menu_formatter = MenuFormatter.new(Kernel, menu)
      expect { menu_formatter.format }.to output("Pad Thai: £7.50\n").to_stdout
    end

    it "prints the menu with multiple dishes and their price" do
      dish_1 = Dish.new("pad thai", 7.5)
      dish_2 = Dish.new("green curry", 8)
      dish_3 = Dish.new("red curry", 7.551)
      menu = Menu.new
      menu.add_dish(dish_1)
      menu.add_dish(dish_2)
      menu.add_dish(dish_3)
      menu_formatter = MenuFormatter.new(Kernel, menu)
      expect { menu_formatter.format }.to output("Pad Thai: £7.50\nGreen Curry: £8.00\nRed Curry: £7.55\n").to_stdout
    end
end