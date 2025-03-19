class Triangle
  attr_reader :rows

  def initialize(n)
    @rows = (1..n).each_with_object([[1]]) do |_, result|
      result << [1] + result.last.each_cons(2).map(&:sum) + [1] if result.size < n
    end
  end
end
