module PrimeFactors
  def self.of(n)
    return [] if n < 2

    factor = (2..).find { |i| (n % i).zero? }

    [factor] + of(n / factor)
  end
end
