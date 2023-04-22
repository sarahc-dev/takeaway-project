class ReceiptFormatter
  def initialize(io, order)
    @io = io
    @order = order
  end

  def format
    @order.items_in_order.tally.each do |k, v|
      # k = dish v = count
      formatted_name = k.name.split.map(&:capitalize).join(" ")
      formatted_price = "%.2f" % (k.price * v)
      @io.puts "#{v} #{formatted_name} @ £#{formatted_price}"
    end
    @io.puts "Total: £#{"%.2f" % @order.total}"
  end
end