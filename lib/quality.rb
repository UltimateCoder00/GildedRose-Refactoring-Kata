class Quality

  CHANGE_AMOUNT = {
    aged_brie: {quality_change: 1},
    sulfuras: {quality_change: 0},
    backstage_passes: {quality_change: 1},
    conjured: {quality_change: -1}
  }

  ITEM_MAX_QUALITY = 50

  def initialize(items)
    @items = items
  end

  def change()
    @items.each do |item|
      unless item_is_sulfuras?(item.name) || item.quality == ITEM_MAX_QUALITY

        item.sell_in -= 1

        if item_is_aged_brie?(item.name) || item_is_backstage_passed?(item.name)

          item.quality += 1

          if item_is_backstage_passed?(item.name)
            if item.sell_in < 11
              item.quality += 1
            end

            if item.sell_in < 6
              item.quality += 1
            end

            if item.sell_in < 0
              item.quality = 0
            end
          else
            if item.sell_in < 0
              item.quality += 1
            end
          end

          if item.sell_in < 0
            item.quality = 0
          end

        else
          item.quality -= 1

          if item_is_conjured?(item.name)
            item.quality -= 1
          end

          if item.sell_in < 0
            item.quality -= 1
          end

        end
      end
    end
  end

  private

  def item_is_sulfuras?(name)
    name == "Sulfuras, Hand of Ragnaros"
  end

  def item_is_aged_brie?(name)
    name == "Aged Brie"
  end

  def item_is_backstage_passed?(name)
    name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def item_is_conjured?(name)
    name == "Conjured Mana Cake"
  end
end
