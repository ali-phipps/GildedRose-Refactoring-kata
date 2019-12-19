require ('gilded_rose')

describe GildedRose do
  # subject(:rose) {GildedRose.new(items)}

  describe "#basic_item" do

    it "days remaining greater than sellin decreases qty and sellin by 1" do
      items = [Item.new("+5 Dexterity Vest", 10, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].to_s).to eq "+5 Dexterity Vest, 9, 19"
    end

    it "days remaining less than sellin decreases qty by 2 and sellin by 1" do
      items = [Item.new("+5 Dexterity Vest",0, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].to_s).to eq "+5 Dexterity Vest, -1, 18"
    end

    it "qty cannot be less than 0" do
      items = [Item.new("+5 Dexterity Vest",1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].to_s).to eq "+5 Dexterity Vest, 0, 0"
    end
  end

  describe "#aged_brie" do
    it " brie increases quality the older it gets" do
      items = [Item.new("Aged Brie", 5, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].to_s).to eq "Aged Brie, 4, 2"
    end

    it " brie cannot have a quality greater than 50" do
      items = [Item.new("Aged Brie", 5, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].to_s).to eq "Aged Brie, 4, 50"
    end

    it " brie quantity increases twice as fast after sellin past" do
      items = [Item.new("Aged Brie", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].to_s).to eq "Aged Brie, -1, 12"
    end
  end
end
