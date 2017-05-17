require 'item'

class BackStagePasses < Item

  attr_reader :sell_in, :quality

  QUALITY_CHANGE = ITEM_QUALITY_CHANGE_VALUE

  def initialize(sell_in, quality)
    @sell_in = sell_in
    @quality = quality
  end

  def change_quality
    if @sell_in <= 0
      @quality = 0
    elsif @sell_in <= 5
      @quality = @quality - (QUALITY_CHANGE * 3)
    elsif @sell_in <= 10
      @quality = @quality - (QUALITY_CHANGE * 2)
    else
      @quality = @quality - QUALITY_CHANGE
    end
  end
end
