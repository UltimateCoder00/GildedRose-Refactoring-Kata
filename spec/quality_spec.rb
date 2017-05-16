require 'quality'

describe Quality do

  subject(:itemlist) {described_class.new}

  let(:item) { double(:item, name: name, sell_in: sell_in, quality: quality) }
  let(:name) {"Aged Brie"}
  let(:sell_in) {5}
  let(:quality) {10}

  # describe "Initialization" do
  #   it "checks items is empty" do
  #     expect(itemlist.items).to eq []
  #   end
  # end
  #
  # describe "#add_item" do
  #   it "adds item to the list" do
  #     expect(itemlist.add_item(item)).to eq [item]
  #   end
  # end
  #
  # describe "#remove_item" do
  #   it "removes item from the list" do
  #     itemlist.add_item(item)
  #     expect(itemlist.remove_item(item)).to eq item
  #   end
  # end

end
