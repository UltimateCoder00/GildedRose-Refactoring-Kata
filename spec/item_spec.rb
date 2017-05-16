require 'item'

describe Item do

  subject(:item) {described_class.new(name, sell_in, quality)}

  let(:name) {"Aged Brie"}
  let(:sell_in) {5}
  let(:quality) {10}

  describe "Initialization" do
    it "checks items name" do
      expect(item.name).to eq "#{name}"
    end

    it "checks items expiry date" do
      expect(item.sell_in).to eq sell_in
    end

    it "checks items quality" do
      expect(item.quality).to eq quality
    end
  end

  describe "Change item details" do
    it "#name" do
      expect(item.name=("Sulfuras")).to eq "Sulfuras"
    end

    it "#sell_in" do
      expect(item.sell_in=(10)).to eq 10
    end

    it "#quality" do
      expect(item.quality=(20)).to eq 20
    end
  end

  describe "#to_s" do
    it "displays items name, expiry date and quality" do
      expect(item.to_s).to eq "#{name}, #{sell_in}, #{quality}"
    end
  end

end
