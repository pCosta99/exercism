class Bst
  include Enumerable

  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
    @right, @left = nil
  end

  def insert(n)
    if n > @data
      @right = @right ? @right.insert(n) : Bst.new(n)
    else
      @left = @left ? @left.insert(n) : Bst.new(n)
    end

    self
  end

  def each(&block)
    return to_enum unless block_given?

    left&.each(&block)
    yield data
    right&.each(&block)
  end
end
