
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if special_item?(item)
        if (item.name == 'Aged Brie')
          update_aged_brie(item)
        elsif (item.name =='Backstage passes to a TAFKAL80ETC concert')
          update_backstage_pass(item)
        elsif (item.name =='Conjured')
          update_conjured(item)
        end
      else
        update_basic_item(item)
      end
      update_sell_in(item) unless item.name == ("Sulfuras, Hand of Ragnaros")
    end
  end

  private
  def special_item?(item)
    item.name == ("Aged Brie") or
    item.name == ("Sulfuras, Hand of Ragnaros") or
    item.name == ('Backstage passes to a TAFKAL80ETC concert') or
    item.name == ('Conjured')
  end

  def update_sell_in(item)
    item.sell_in -= 1
  end

  def update_conjured(item)
    if (item.quality > 0)
      item.quality -= 2
    end
  end

  def update_basic_item(item)
    if (item.quality > 0 )
      if (item.sell_in <= 0)
        item.quality -= 2
      else
        item.quality -= 1
      end
    end
  end

  def update_aged_brie(item)
    if (item.quality < 50)
      if (item.sell_in <= 0)
        item.quality += 2
      else
        item.quality += 1
      end
    end
  end

  def update_backstage_pass(item)
    if (item.sell_in > 10)
      item.quality += 1
    elsif(item.sell_in > 5)
      item.quality += 2
    elsif(item.sell_in > 0)
      item.quality += 3
    else
      item.quality = 0
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
