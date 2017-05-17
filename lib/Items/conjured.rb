require 'item'

class Conjured < Item
  attr_reader :quality

  QUALITY_CHANGE = ITEM_QUALITY_CHANGE_VALUE * 2

  def initialize(quality)
    @quality = quality - QUALITY_CHANGE
  end

  def change_quality
    @quality < 0 ? 0 : @quality
  end
end
