module ArmstrongNumbers
  def self.include?(number)
    digits = number.digits

    digits.sum { |n| n**digits.length } == number
  end
end
