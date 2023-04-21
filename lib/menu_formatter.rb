class MenuFormatter
  def initialize(io, menu)
    @io = io
    @menu = menu
  end

  def format
      @menu.list.each do |item|
        formatted_name = item.name.split.map(&:capitalize).join(" ")
        formatted_price = "%.2f" % item.price
        @io.puts "#{formatted_name}: £#{formatted_price}"
      end
  end
end