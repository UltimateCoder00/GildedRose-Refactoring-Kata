require './lib/Items/backstage_passes.rb'

describe BackStagePasses do

  subject(:backstage_passes) {described_class.new(sell_in, quality)}

  let(:backstage_passes2) {described_class.new(sell_in2, quality)}
  let(:backstage_passes3) {described_class.new(sell_in3, quality)}
  let(:backstage_passes4) {described_class.new(sell_in4, quality)}

  let(:quality) {20}
  let(:sell_in) {20}
  let(:sell_in2) {10}
  let(:sell_in3) {5}
  let(:sell_in4) {0}

  describe "Initialization" do
    it "checks sell_in value is stored" do
      expect(backstage_passes.sell_in).to eq sell_in
    end

    it "checks quality value is stored" do
      expect(backstage_passes.quality).to eq quality
    end
  end

  describe "#change_quality" do
    it "decreases the quality" do
      expect(backstage_passes.change_quality).to eq quality - BackStagePasses::QUALITY_CHANGE
    end

    it "decreases the quality by 2 when sell_in<=10" do
      expect(backstage_passes2.change_quality).to eq quality - (BackStagePasses::QUALITY_CHANGE)*2
    end

    it "decreases the quality by 3 when sell_in<=5" do
      expect(backstage_passes3.change_quality).to eq quality - (BackStagePasses::QUALITY_CHANGE)*3
    end

    it "decreases the quality to 0  when sell_in<=0" do
      expect(backstage_passes4.change_quality).to eq 0
    end
  end

end
