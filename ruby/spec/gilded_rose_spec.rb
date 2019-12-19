require 'gilded_rose'
require 'item'

describe GildedRose do

  context '#basic_item' do
    it 'days remaining greater than sellin decreases qty and sellin by 1' do
      items = [Item.new('+5 Dexterity Vest', 10, 20)]
      GildedRose.new(items).update_item
      expect(items[0].to_s).to eq '+5 Dexterity Vest, 9, 19'
    end

    it 'days remaining less than sellin decreases qty by 2 and sellin by 1' do
      items = [Item.new('+5 Dexterity Vest', 0, 20)]
      GildedRose.new(items).update_item
      expect(items[0].to_s).to eq '+5 Dexterity Vest, -1, 18'
    end

    it 'qty cannot be less than 0' do
      items = [Item.new('+5 Dexterity Vest', 1, 0)]
      GildedRose.new(items).update_item
      expect(items[0].to_s).to eq '+5 Dexterity Vest, 0, 0'
    end
  end

  context '#aged_brie' do
    it ' brie increases quality the older it gets' do
      items = [Item.new('Aged Brie', 5, 1)]
      GildedRose.new(items).update_item
      expect(items[0].to_s).to eq 'Aged Brie, 4, 2'
    end

    it ' brie cannot have a quality greater than 50' do
      items = [Item.new('Aged Brie', 5, 50)]
      GildedRose.new(items).update_item
      expect(items[0].to_s).to eq 'Aged Brie, 4, 50'
    end

    it ' brie quantity increases twice as fast after sellin past' do
      items = [Item.new('Aged Brie', 0, 10)]
      GildedRose.new(items).update_item
      expect(items[0].to_s).to eq 'Aged Brie, -1, 12'
    end
  end

  context '#Sulfuras' do
    it "doesn't change its quantity" do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80)]
      GildedRose.new(items).update_item
      expect(items[0].to_s).to eq 'Sulfuras, Hand of Ragnaros, 0, 80'
    end
  end

  context '#back_stage_passes' do
    it 'increase qty by 1 when there are more than 10 days left' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 10)]
      GildedRose.new(items).update_item
      expect(items[0].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 10, 11'
    end

    it 'increase qty by 2 when there are 10 days left' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 10)]
      GildedRose.new(items).update_item
      expect(items[0].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 9, 12'
    end

    it 'increase qty by 3 when there are 5 days left' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 10)]
      GildedRose.new(items).update_item
      expect(items[0].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 4, 13'
    end

    it 'qty set to 0  when there are 0 days left' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 10)]
      GildedRose.new(items).update_item
      expect(items[0].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, -1, 0'
    end
  end

  context 'Conjured item' do
    it 'degrade in quality twice as fast as normal items' do
      items = [Item.new('Conjured', 10, 10)]
      GildedRose.new(items).update_item
      expect(items[0].to_s).to eq 'Conjured, 9, 8'
    end

    it 'qty cannot be less than 0' do
      items = [Item.new('Conjured', 10, 0)]
      GildedRose.new(items).update_item
      expect(items[0].to_s).to eq 'Conjured, 9, 0'
    end
  end
end
