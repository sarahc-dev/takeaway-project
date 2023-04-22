require 'order'
require 'menu'
require 'dish'

describe Order do
  context "#items_in_order" do
    it "initially has an empty list in the order" do
      menu = Menu.new
      order = Order.new(menu)
      expect(order.items_in_order).to eq []
    end
  end

  context "#add" do
    it "adds items to the order" do
      dish = Dish.new("pad thai", 8)
      menu = Menu.new
      menu.add_dish(dish)
      order = Order.new(menu)
      order.add(dish, 1)
      expect(order.items_in_order).to eq [dish]
    end

    it "adds 3 of a dish to the order" do
      dish = Dish.new("pad thai", 8)
      menu = Menu.new
      menu.add_dish(dish)
      order = Order.new(menu)
      order.add(dish, 3)
      expect(order.items_in_order).to eq [dish, dish, dish]
    end

    it "adds multiple items to the order" do
      dish_1 = Dish.new("pad thai", 8)
      dish_2 = Dish.new("green curry", 8.5)
      dish_3 = Dish.new("jasmine rice", 3.25)
      menu = Menu.new
      menu.add_dish(dish_1)
      menu.add_dish(dish_2)
      menu.add_dish(dish_3)
      order = Order.new(menu)
      order.add(dish_1, 2)
      order.add(dish_2, 3)
      order.add(dish_3, 2)
      expect(order.items_in_order).to eq [dish_1, dish_1, dish_2, dish_2, dish_2, dish_3, dish_3]
    end

    it "fails if amount is not a number" do
      dish = Dish.new("pad thai", 8)
      menu = Menu.new
      menu.add_dish(dish)
      order = Order.new(menu)
      expect { order.add(dish, "3") }.to raise_error "amount should be an integer"
    end

    it "fails when the dish is not in the menu" do
      dish = Dish.new("pad thai", 8)
      menu = Menu.new
      order = Order.new(menu)
      expect { order.add(dish, 1) }.to raise_error "chosen dish is not on the menu"
      expect { order.add("pad thai", 1) }.to raise_error "chosen dish is not on the menu"
    end
  end

  context "#total" do
    it "returns the total cost of the order" do
      dish = Dish.new("pad thai", 8)
      menu = Menu.new
      menu.add_dish(dish)
      order = Order.new(menu)
      order.add(dish, 3)
      expect(order.total).to eq 24
    end
  end
end