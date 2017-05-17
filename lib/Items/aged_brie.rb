require 'item'

class AgedBrie < Item

  attr_reader :quality

  QUALITY_CHANGE = ITEM_QUALITY_CHANGE_VALUE

  def initialize(quality)
    @quality = quality + QUALITY_CHANGE
  end

  def change_quality
    @quality > 50 ? 50 : @quality
  end
end
