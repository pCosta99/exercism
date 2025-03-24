module BookStore
  COSTS = {
    1 => 8,
    2 => 15.2,
    3 => 21.6,
    4 => 25.6,
    5 => 30
  }

  def self.calculate_price(basket)
    @memo = {}

    min_price(basket)
  end

  def self.min_price(basket)
    return 0 if basket.empty?

    return @memo[basket] if @memo[basket]

    min_price = Float::INFINITY
    tally = basket.tally
    options = tally.keys

    1.upto(options.count).each do |bundle_size|
      options.combination(bundle_size).each do |bundle|
        new_basket = basket.dup
        bundle.each { |book| new_basket.delete_at(new_basket.index(book)) }

        current_price = COSTS[bundle_size] + min_price(new_basket)

        min_price = [min_price, current_price].min
      end
    end

    @memo[basket] = min_price

    min_price
  end
end
