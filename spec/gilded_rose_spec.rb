require 'gilded_rose'

describe GildedRose do

  subject(:gilded_rose) {described_class.new(item)}

  let(:item) { double(:item, name: name, sell_in: sell_in, quality: quality) }

  let(:name) {"Aged Brie"}
  let(:sell_in) {5}
  let(:quality) {10}

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end
  end

end
