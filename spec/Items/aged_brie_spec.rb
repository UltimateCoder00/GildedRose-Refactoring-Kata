require './lib/Items/aged_brie.rb'

describe AgedBrie do

  subject(:aged_brie) {described_class.new(quality)}
  let(:aged_brie2) {described_class.new(quality2)}

  let(:quality) {20}
  let(:quality2) {50}

  describe "Initialization" do
    it "checks quality value is stored" do
      expect(aged_brie.quality).to eq quality + AgedBrie::QUALITY_CHANGE
    end
  end

  describe "#change_quality" do
    it "increases the quality by 1" do
      expect(aged_brie.change_quality).to eq (quality + AgedBrie::QUALITY_CHANGE)
    end

    it "changes quality to 50 if quality>=50" do
      expect(aged_brie2.change_quality).to eq 50
    end
  end

end
