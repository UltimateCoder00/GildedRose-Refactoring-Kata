require './lib/Items/aged_brie.rb'

describe AgedBrie do

  subject(:aged_brie) {described_class.new(quality)}

  let(:quality) {20}

  describe "Initialization" do
    it "checks quality value is stored" do
      expect(aged_brie.quality).to eq quality
    end
  end

  describe "#change_quality" do
    it "increases the quality by 1" do
      expect{ aged_brie.change_quality }.to change { aged_brie.quality }.by(AgedBrie::QUALITY_CHANGE)
    end
  end

end
