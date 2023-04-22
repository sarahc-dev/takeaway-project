require 'menu'

describe Menu do
  context "#list" do
    it "initially has an empty list of menu_items" do
      menu = Menu.new
      expect(menu.list).to eq []
    end
  end

  context "#add_dish" do
    it "adds a dish to the menu" do
      menu = Menu.new
      dish = double(:dish)
      menu.add_dish(dish)
      expect(menu.list).to eq [dish]
    end

    it "adds multiple dishes to the menu" do
      menu = Menu.new
      dish_1 = double(:dish)
      dish_2 = double(:dish)
      dish_3 = double(:dish)
      menu.add_dish(dish_1)
      menu.add_dish(dish_2)
      menu.add_dish(dish_3)
      expect(menu.list).to eq [dish_1, dish_2, dish_3]
    end
  end
end