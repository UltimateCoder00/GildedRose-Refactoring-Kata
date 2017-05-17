require 'item'

class Conjured < Item
  attr_reader :quality

  QUALITY_CHANGE = ITEM_QUALITY_CHANGE_VALUE * 2

  def initialize(quality)
    @quality = quality
  end

  def change_quality
    @quality = @quality - QUALITY_CHANGE

    if @quality < 0
      return 0
    else
      @quality
    end
  end
end
