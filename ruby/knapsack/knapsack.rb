require 'debug'

Item = Data.define(:weight, :value)

class Knapsack
  attr_reader :max_weight

  def initialize(max_weight)
    @max_weight = max_weight
  end

  def max_value(items)
    dp = Array.new(@max_weight + 1, 0)

    items.each do |item|
      @max_weight.downto(item.weight) do |w|
        dp[w] = [dp[w], dp[w - item.weight] + item.value].max
      end
    end

    dp[@max_weight]
  end
end
