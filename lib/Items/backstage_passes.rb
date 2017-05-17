require 'item'

class BackStagePasses < Item

  attr_reader :sell_in, :quality

  QUALITY_CHANGE = ITEM_QUALITY_CHANGE_VALUE

  def initialize(sell_in, quality)
    @sell_in = sell_in
    @quality = quality
  end

  def change_quality
    @sell_in <= 0 ? 0 : quality_more_than_50?
  end

  private

  def quality_change_factor
    if @sell_in <= 5
      QUALITY_CHANGE * 3
    elsif @sell_in <= 10
      QUALITY_CHANGE * 2
    else
      QUALITY_CHANGE
    end
  end

  def quality_more_than_50?
    @quality + (QUALITY_CHANGE * quality_change_factor ) > 50 ? 50 : @quality + (QUALITY_CHANGE * quality_change_factor )
  end
end
