
class GildedRose
  def initialize(items)
    @items = items
  end

  def special_item?(item)
    item.name == ("Aged Brie") or
    item.name == ("Sulfuras, Hand of Ragnaros") or
    item.name == ('Backstage passes to a TAFKAL80ETC concert')
  end

  def update_basic_item(item)
    if(item.quality > 0 )
      if (item.sell_in <= 0)
        item.quality -= 2
      else
        item.quality -= 1
      end
    end
    item.sell_in -= 1
  end

  def update_aged_brie(item)
    if(item.quality < 50)
      if (item.sell_in <= 0)
        item.quality += 2
      else
        item.quality += 1
      end
    end
    item.sell_in -= 1
  end

  def update_quality
    @items.each do |item|
      if special_item?(item)
        if (item.name == 'Aged Brie')
          update_aged_brie(item)
        e
      else
        update_basic_item(item)
      end

  #     if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
  #       if item.quality > 0
  #         if item.name != 'Sulfuras, Hand of Ragnaros'
  #           item.quality = item.quality - 1
  #         end
  #       end
  #     else
  #       if item.quality < 50
  #         item.quality = item.quality + 1
  #         if item.name == 'Backstage passes to a TAFKAL80ETC concert'
  #           if item.sell_in < 11
  #             item.quality = item.quality + 1 if item.quality < 50
  #           end
  #           if item.sell_in < 6
  #             item.quality = item.quality + 1 if item.quality < 50
  #           end
  #         end
  #       end
  #     end
  #     if item.name != 'Sulfuras, Hand of Ragnaros'
  #       item.sell_in = item.sell_in - 1
  #     end
  #     if item.sell_in < 0
  #       if item.name != 'Aged Brie'
  #         if item.name != 'Backstage passes to a TAFKAL80ETC concert'
  #           if item.quality > 0
  #             if item.name != 'Sulfuras, Hand of Ragnaros'
  #               item.quality = item.quality - 1
  #             end
  #           end
  #         else
  #           item.quality = item.quality - item.quality
  #         end
  #       else
  #         item.quality = item.quality + 1 if item.quality < 50
  #       end
  #     end
     end

end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
