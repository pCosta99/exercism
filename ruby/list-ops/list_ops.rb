module ListOps
  def self.foldr(list, acc, &block)
    list.reduce(acc) { |acc, x| block.call(x, acc) }
  end

  def self.arrays(list)
    foldr(list, 0) { |_, acc| 1 + acc }
  end

  def self.reverser(list)
    foldr(list, []) { |c, acc| acc.unshift(c) }
  end

  def self.concatter(l1, l2)
    foldr(l2, l1) { |c, acc| acc << c }
  end

  def self.mapper(list, &block)
    foldr(list, []) { |c, acc| acc << block.call(c) }
  end

  def self.filterer(list, &block)
    foldr(list, []) { |c, acc| block.call(c) ? acc << c : acc }
  end

  def self.sum_reducer(list)
    foldr(list, 0, &:+)
  end

  def self.factorial_reducer(list)
    foldr(list, 1, &:*)
  end
end
