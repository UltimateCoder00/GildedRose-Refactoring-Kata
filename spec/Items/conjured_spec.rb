require './lib/Items/conjured.rb'

describe Conjured do

  subject(:conjured) {described_class.new(quality)}
  let(:conjured2) {described_class.new(quality2)}

  let(:quality) {20}
  let(:quality2) {1}

  describe "#quality" do
    it "decreases the quality by 2" do
      expect(conjured.quality).to eq (quality - Conjured::QUALITY_CHANGE)
    end
  end

  describe "#change_quality" do
    it "decreases the quality by 2" do
      expect(conjured.change_quality).to eq (quality - Conjured::QUALITY_CHANGE)
    end

    it "changes quality to 0 if quality<=0" do
      expect(conjured2.change_quality).to eq 0
    end
  end

end
