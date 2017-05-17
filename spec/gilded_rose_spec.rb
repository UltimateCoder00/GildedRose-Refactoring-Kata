require 'gilded_rose'

describe GildedRose do

  subject(:gilded_rose) {described_class.new(items)}

  let(:items) {
                [
                  Item.new(name="Dexterity Vest", sell_in=0, quality=20),
                  Item.new(name="Aged Brie", sell_in=2, quality=0),
                  Item.new(name="Sulfuras", sell_in=5, quality=80),
                  Item.new(name="Backstage passes", sell_in=15, quality=20),
                  Item.new(name="Backstage passes", sell_in=10, quality=20),
                  Item.new(name="Backstage passes", sell_in=5, quality=20),
                  Item.new(name="Backstage passes", sell_in=0, quality=20),
                  Item.new(name="Backstage passes", sell_in=5, quality=49),
                  Item.new(name="Conjured", sell_in=3, quality=6)
                ]
              }

  describe "#update_quality" do

    before do
      gilded_rose.update_quality()
    end

    it "does not change the name" do
      for i in 0..(items.length - 1)
        expect{ gilded_rose.update_quality() }.to_not change { items[i].name }
      end
    end

    it "decreases the quality twices the amount when sell_in=0" do
      expect{ gilded_rose.update_quality() }.to change { items[0].quality }.by(-2)
    end

    it "checks the quality is greater than 0" do
      for i in 0..(items.length - 1)
        expect(items[i].quality).to be >= 0
      end
    end

    it "checks quality max is 50" do
      for i in 0..(items.length - 1)
        expect(items[i].quality).to be <= 50 unless i == 2
      end
    end

    describe "Aged Brie" do
      context "increases quality as sell_in decreases" do
        it "sell_in decreases" do
          expect{ gilded_rose.update_quality() }.to change { items[1].sell_in }.by(-1)
        end

        it "quality increases" do
          expect{ gilded_rose.update_quality() }.to change { items[1].quality }.by(1)
        end
      end
    end

    describe "Sulfuras" do
      it "checks that sell_in and quality does not change" do
        expect{ gilded_rose.update_quality() }.to change { items[2].sell_in }.by(0)
        expect{ gilded_rose.update_quality() }.to change { items[2].quality }.by(0)
      end
    end

    describe "Backstage passes" do
      it "changes the quality by normal amount when sell_in>10" do
        expect{ gilded_rose.update_quality() }.to change { items[3].quality }.by(1)
      end

      it "changes the quality by twice the amount when sell_in<=10" do
        expect{ gilded_rose.update_quality() }.to change { items[4].quality }.by(2)
      end

      it "changes the quality by three times the amount when sell_in<=5" do
        expect{ gilded_rose.update_quality() }.to change { items[5].quality }.by(3)
      end

      it "changes quality to quality=0 when sell_in=0" do
        expect{ gilded_rose.update_quality() }.to change { items[6].quality }.by(items[6].quality)
      end
    end

    describe "Conjured" do
      it "changes the quality by twice the normal amount" do
        expect{ gilded_rose.update_quality() }.to change { items[8].quality }.by(-2)
      end
    end

  end

end
