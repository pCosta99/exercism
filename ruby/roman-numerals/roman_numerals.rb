class Integer
  TO_ROMAN = [
    [1000, 'M'],
    [900, 'CM'],
    [500, 'D'],
    [400, 'CD'],
    [100, 'C'],
    [90, 'XC'],
    [50, 'L'],
    [40, 'XL'],
    [10, 'X'],
    [9, 'IX'],
    [5, 'V'],
    [4, 'IV'],
    [1, 'I']
  ]

  def to_roman
    TO_ROMAN.reduce(['', self]) do |(result, num), (value, roman)|
      while num >= value
        result << roman
        num -= value
      end

      [result, num]
    end.first
  end
end
