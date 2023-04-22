require 'order'

describe Order do
  context "#items_in_order" do
    it "initially has an empty list in the order" do
      fake_menu = double :menu
      order = Order.new(fake_menu)
      expect(order.items_in_order).to eq []
    end
  end

  context "#add" do
    it "adds items to the order" do
      fake_dish = double :dish
      fake_menu = double(:menu, list: [fake_dish])
      order = Order.new(fake_menu)
      order.add(fake_dish, 1)
      expect(order.items_in_order).to eq [fake_dish]
    end

    it "adds 3 of a dish to the order" do
      fake_dish = double :dish
      fake_menu = double(:menu, list: [fake_dish])
      order = Order.new(fake_menu)
      order.add(fake_dish, 3)
      expect(order.items_in_order).to eq [fake_dish, fake_dish, fake_dish]
    end

    it "adds multiple items to the order" do
      dish_1 = double :dish
      dish_2 = double :dish
      dish_3 = double :dish
      fake_menu = double(:menu, list: [dish_1, dish_2, dish_3])
      order = Order.new(fake_menu)
      order.add(dish_1, 2)
      order.add(dish_2, 3)
      order.add(dish_3, 2)
      expect(order.items_in_order).to eq [dish_1, dish_1, dish_2, dish_2, dish_2, dish_3, dish_3]
    end

    it "fails if amount is not a number" do
      fake_dish = double :dish
      fake_menu = double :menu
      order = Order.new(fake_menu)
      expect { order.add(fake_dish, "3") }.to raise_error "amount should be an integer"
    end

    it "fails when the dish is not in the menu" do
      fake_dish = double :dish
      fake_menu = double(:menu, list: [])
      order = Order.new(fake_menu)
      expect { order.add(fake_dish, 1) }.to raise_error "chosen dish is not on the menu"
      expect { order.add("pad thai", 1) }.to raise_error "chosen dish is not on the menu"
    end
  end

  context "#total" do
    it "returns 0 if nothing in the order" do
      fake_menu = double :menu
      order = Order.new(fake_menu)
      expect(order.total).to eq 0
    end

    it "returns the total cost of the order" do
      fake_dish = double(:dish, name: "pad thai", price: 8)
      fake_menu = double(:menu, list: [fake_dish])
      order = Order.new(fake_menu)
      order.add(fake_dish, 3)
      expect(order.total).to eq 24
    end
  end
end