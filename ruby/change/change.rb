require 'debug'

module Change
  class ImpossibleCombinationError < StandardError
  end

  class NegativeTargetError < StandardError
  end

  def self.generate(coins, amount)
    raise NegativeTargetError if amount.negative?

    dp = Array.new(amount + 1, Float::INFINITY)
    dp[0] = 0
    coin_used = Array.new(amount + 1, nil)

    coins.each do |coin|
      (coin..amount).each do |i|
        if dp[i - coin] + 1 < dp[i]
          dp[i] = dp[i - coin] + 1
          coin_used[i] = coin
        end
      end
    end

    raise ImpossibleCombinationError if dp[amount] == Float::INFINITY

    result = []

    while amount.positive?
      result << coin_used[amount]
      amount -= coin_used[amount]
    end

    result.sort
  end
end
