require './lib/Items/conjured.rb'

describe Conjured do

  subject(:conjured) {described_class.new(quality)}

  let(:quality) {20}

  describe "Initialization" do
    it "checks quality value is stored" do
      expect(conjured.quality).to eq quality
    end
  end

  describe "#change_quality" do
    it "decreases the quality by 2" do
      expect(conjured.change_quality).to eq quality - Conjured::QUALITY_CHANGE
    end
  end

end
