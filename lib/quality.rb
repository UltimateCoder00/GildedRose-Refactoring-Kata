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

      twice_decrease_speed = 1

      if item.sell_in <= 0
        twice_decrease_speed = 2
      end

      if item_is_conjured?(item.name)
        item.quality = Conjured.new(item.quality).change_quality * twice_decrease_speed
      elsif item_is_backstage_passed?(item.name)
        item.quality = BackStagePasses.new(item.sell_in, item.quality).change_quality * twice_decrease_speed
      elsif item_is_aged_brie?(item.name)
        item.quality = AgedBrie.new(item.quality).change_quality
      elsif item_is_sulfuras?(item.name)

      else
        item.quality -= (1 * twice_decrease_speed)
      end

      if item.quality > 50
        item.quality = 50 unless item_is_sulfuras?(item.name)
      end
    end
  end

  private

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
