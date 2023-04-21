require 'menu_formatter'

describe MenuFormatter do
  it "prints the menu with a single dish and price" do
    io = double :io
    fake_dish = double(:fake_dish, name: "pad thai", price: 7.5)
    menu = double(:menu, list: [fake_dish])
    expect(io).to receive(:puts).with("Pad Thai: £7.50")

    menu_formatter = MenuFormatter.new(io, menu)
    menu_formatter.format
  end

  it "prints the menu with multiple dishes and their price" do
    io = double :io
    dish_1 = double(:fake_dish, name: "pad thai", price: 7.5)
    dish_2 = double(:fake_dish, name: "green curry", price: 8)
    dish_3 = double(:fake_dish, name: "red curry", price: 7.551)
    menu = double(:menu, list: [dish_1, dish_2, dish_3])
    expect(io).to receive(:puts).with("Pad Thai: £7.50")
    expect(io).to receive(:puts).with("Green Curry: £8.00")
    expect(io).to receive(:puts).with("Red Curry: £7.55")

    menu_formatter = MenuFormatter.new(io, menu)
    menu_formatter.format
  end
end