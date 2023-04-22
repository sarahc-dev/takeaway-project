require 'receipt_formatter'
require 'order'
require 'menu'
require 'dish'

describe "ReceiptFormatter integration" do
  it "prints the itemised receipt with one order item" do
    dish = Dish.new("pad thai", 7.5)
    menu = Menu.new
    menu.add_dish(dish)
    order = Order.new(menu)
    order.add(dish, 1)
    receipt_formatter = ReceiptFormatter.new(Kernel, order)
    expect { receipt_formatter.format }.to output("1 Pad Thai @ £7.50\nTotal: £7.50\n").to_stdout
  end

  it "prints the itemised receipt and total with multiple items" do
    dish_1 = Dish.new("pad thai", 7.5)
    dish_2 = Dish.new("green curry", 8)
    dish_3 = Dish.new("rice", 3.5)
    menu = Menu.new
    menu.add_dish(dish_1)
    menu.add_dish(dish_2)
    menu.add_dish(dish_3)
    order = Order.new(menu)
    order.add(dish_1, 2)
    order.add(dish_2, 1)
    order.add(dish_3, 2)
    receipt_formatter = ReceiptFormatter.new(Kernel, order)
    expect { receipt_formatter.format }.to output("2 Pad Thai @ £15.00\n1 Green Curry @ £8.00\n2 Rice @ £7.00\nTotal: £30.00\n").to_stdout
  end
end
