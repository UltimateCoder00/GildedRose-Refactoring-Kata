class Quality

  ITEM_MAX_QUALITY = 50
  QUALITY_CHANGE = 1

  def initialize(items)
    @items = items
  end

  def change()
    @items.each do |item|
      unless item_is_sulfuras?(item.name)
        item.sell_in -= 1
      end

      item.quality = change_quality(item.name, item.sell_in, item.quality)
    end
  end

  private

  def change_quality(name, sell_in, quality)
    twice_decrease_speed = QUALITY_CHANGE

    if sell_in <= 0
      twice_decrease_speed = QUALITY_CHANGE * 2
    end

    if item_is_conjured?(name)
      quality = Conjured.new(quality).change_quality * twice_decrease_speed
    elsif item_is_backstage_passed?(name)
      quality = BackStagePasses.new(sell_in, quality).change_quality * twice_decrease_speed
    elsif item_is_aged_brie?(name)
      quality = AgedBrie.new(quality).change_quality
    elsif item_is_sulfuras?(name)
      quality
    else
      quality -= (QUALITY_CHANGE * twice_decrease_speed)
    end
  end

  def item_is_sulfuras?(name)
    name == "Sulfuras"
  end

  def item_is_aged_brie?(name)
    name == "Aged Brie"
  end

  def item_is_backstage_passed?(name)
    name == "Backstage passes"
  end

  def item_is_conjured?(name)
    name == "Conjured"
  end
end
