require 'item'

class AgedBrie < Item

  attr_reader :quality

  QUALITY_CHANGE = ITEM_QUALITY_CHANGE_VALUE

  def initialize(quality)
    @quality = quality
  end

  def change_quality
    @quality = @quality + QUALITY_CHANGE

    if @quality > 50
      @quality = 50
    else
      @quality
    end
  end
end
