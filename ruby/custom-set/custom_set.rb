class CustomSet
  def initialize(initial_elements = [])
    @elements = {}

    initial_elements.each do |elem|
      add(elem)
    end
  end

  def add(elem)
    @elements[elem] = true

    self
  end

  def empty?
    @elements.empty?
  end

  def member?(elem)
    @elements.key?(elem)
  end

  def subset?(other)
    keys.all? { |elem| other.member?(elem) }
  end

  def disjoint?(other)
    keys.none? { |elem| other.member?(elem) }
  end

  def intersection(other)
    CustomSet.new(keys.filter { |elem| other.member?(elem) })
  end

  def difference(other)
    CustomSet.new(keys - other.keys)
  end

  def union(other)
    CustomSet.new(keys + other.keys)
  end

  def ==(other)
    subset?(other) && other.subset?(self)
  end

  def keys
    @elements.keys
  end
end
