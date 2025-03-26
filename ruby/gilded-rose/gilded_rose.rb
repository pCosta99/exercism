Item = Struct.new(:name, :sell_in, :quality, :conjured)

class GildedRose
  def initialize(items)
    @items = items
  end

  def update!
    @items.each do |item|
      item.conjured = item.name.include?('Conjured')
      item.name = item.name.gsub('Conjured ', '').downcase

      case item.name
      when 'aged brie'
        update_aged_brie(item)
      when 'backstage passes to a tafkal80etc concert'
        update_backstage_pass(item)
      when 'sulfuras, hand of ragnaros'
        update_sulfuras(item)
      else
        update_normal_item(item)
      end
    end
  end

  private

  def update_aged_brie(item)
    item.sell_in -= 1

    return if item.quality >= 50

    item.quality += 1
    item.quality += 1 if item.sell_in.negative?

    item.quality = item.quality.clamp(0, 50)

    item.quality = 0 if item.conjured && item.sell_in.negative?
  end

  def update_sulfuras(item)
    return unless item.conjured

    item.sell_in -= 1
    item.quality = 0 if item.sell_in.negative?
  end

  def update_normal_item(item)
    item.quality = 0 if item.conjured && !item.sell_in.positive?

    item.sell_in -= 1

    return unless item.quality.positive?

    item.quality -= 1
    item.quality -= 1 if item.sell_in.negative? || item.conjured

    item.quality = item.quality.clamp(0, 50)
  end

  def update_backstage_pass(item)
    item.quality += 1 unless item.conjured
    item.quality += 1 if item.sell_in < 11
    item.quality += 1 if item.sell_in < 6
    item.quality = item.quality.clamp(0, 50)

    item.sell_in -= 1

    item.quality = 0 if item.sell_in.negative?
  end
end
