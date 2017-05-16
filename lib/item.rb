class Item
  attr_accessor :sell_in, :quality
  attr_accessor :name

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def change_quality(name)
    Quality.new(name).change
  end
end
