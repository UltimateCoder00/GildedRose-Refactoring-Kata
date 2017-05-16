class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    Quality.new(@items).change
  end

end
