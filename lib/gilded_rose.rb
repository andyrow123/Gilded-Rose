class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      case item.name
        when 'Aged Brie'
          return aged_brie_update(item)
        when 'Sulfuras, Hand of Ragnaros'
          return sulfuras_update
        when 'Backstage passes to a TAFKAL80ETC concert'
          return backstage_pass_update(item)
        else
          return normal_update(item)
      end
    end
  end

  def normal_update(item)
    item.sell_in -= 1
    return if item.quality.zero?

    item.quality -= 1
    item.quality -= 1 if item.sell_in <= 0
  end

  def aged_brie_update (item)
    item.sell_in -= 1
    return if item.quality == 50

    item.quality += 1
    item.quality += 1 if item.sell_in <= 0
  end

  def sulfuras_update
  end

  def backstage_pass_update(item)
    item.sell_in -= 1
    return if item.quality == 50
    return item.quality = 0 if item.sell_in < 0

    item.quality += 1
    item.quality += 1 if item.sell_in < 10
    item.quality += 1 if item.sell_in < 5
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

