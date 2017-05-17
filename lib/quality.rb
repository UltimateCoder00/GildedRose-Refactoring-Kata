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

      # if item_is_sulfuras?(item.name)
      #
      # elsif item_is_aged_brie?(item.name)
      #
      # elsif item_is_backstage_passed?(item.name)
      #
      # elsif item_is_conjured?(item.name)
      #   item.quality = Conjured.new(item.quality).change_quality
      # else
      #
      # end

      if item_is_conjured?(item.name)
        item.quality = Conjured.new(item.quality).change_quality
      elsif item_is_backstage_passed?(item.name)
        item.quality = BackStagePasses.new(item.sell_in, item.quality).change_quality
      end




      unless item_is_sulfuras?(item.name)

        if item_is_aged_brie?(item.name) || item_is_backstage_passed?(item.name)

          item.quality += 1

          if item_is_backstage_passed?(item.name)
            if item.sell_in < 11
              item.quality += 1
            end

            if item.sell_in < 6
              item.quality += 1
            end

            if item.quality > 50
              item.quality = 50
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

          if item.sell_in < 0
            item.quality -= 1
          end

        end
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
