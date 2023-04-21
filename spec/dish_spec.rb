require 'dish'

describe Dish do
  it "constructs" do
    dish = Dish.new("pad thai", 7.50)
    expect(dish.name).to eq "pad thai"
    expect(dish.price).to eq 7.5
  end

  it "fails if name is not a string" do
    expect{ Dish.new(1, 7.50) }.to raise_error "name should be a string"
  end

  it "fails if price is not a number" do
    expect{ Dish.new("pad thai", true) }.to raise_error "price should be a number"
    expect{ Dish.new("pad thai", "green curry") }.to raise_error "price should be a number"
  end
end