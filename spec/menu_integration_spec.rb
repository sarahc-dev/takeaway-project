require 'menu'
require 'dish'

describe "Menu integration" do
  context "#add_dish and #list" do
    it "adds a dish to the menu" do
      menu = Menu.new
      dish = Dish.new("pad thai", 7.50)
      menu.add_dish(dish)
      expect(menu.list).to eq [dish]
    end

    it "adds multiple dishes to the menu" do
      menu = Menu.new
      dish_1 = Dish.new("pad thai", 7)
      dish_2 = Dish.new("green curry", 8.5)
      dish_3 = Dish.new("red curry", 8.75)
      menu.add_dish(dish_1)
      menu.add_dish(dish_2)
      menu.add_dish(dish_3)
      expect(menu.list).to eq [dish_1, dish_2, dish_3]
    end
  end
end