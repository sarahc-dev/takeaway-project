require 'menu'
require 'dish'

describe Menu do
  context "#add_dish" do
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

  context "#on_menu?" do
    it "confirms a dish is on the menu" do
      menu = Menu.new
      dish = Dish.new("pad thai", 7.50)
      menu.add_dish(dish)
      expect(menu.on_menu?(dish)).to eq true
    end

    it "returns false if dish is not on the menu" do
      menu = Menu.new
      dish = Dish.new("pad thai", 7)
      expect(menu.on_menu?(dish)).to eq false
    end
  end
end