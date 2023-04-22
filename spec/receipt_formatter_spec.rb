require 'receipt_formatter'

describe ReceiptFormatter do
  it "prints the itemised receipt with one order item" do
    io = double :io
    fake_dish = double(:fake_dish, name: "pad thai", price: 7.5)
    fake_order = double(:fake_order, items_in_order: [fake_dish], total: 7.5)
    expect(io).to receive(:puts).with("1 Pad Thai @ £7.50")
    expect(io).to receive(:puts).with("Total: £7.50")
    receipt_formatter = ReceiptFormatter.new(io, fake_order)
    receipt_formatter.format
  end

  it "prints the itemised receipt and total with multiple items" do
    io = double :io
    dish_1 = double(:fake_dish, name: "pad thai", price: 7.5)
    dish_2 = double(:fake_dish, name: "green curry", price: 8)
    dish_3 = double(:fake_dish, name: "rice", price: 3.5)
    fake_order = double(:fake_order, items_in_order: [dish_1, dish_1, dish_2, dish_3, dish_3], total: 30)
    expect(io).to receive(:puts).with("2 Pad Thai @ £15.00")
    expect(io).to receive(:puts).with("1 Green Curry @ £8.00")
    expect(io).to receive(:puts).with("2 Rice @ £7.00")
    expect(io).to receive(:puts).with("Total: £30.00")
    receipt_formatter = ReceiptFormatter.new(io, fake_order)
    receipt_formatter.format
  end
end