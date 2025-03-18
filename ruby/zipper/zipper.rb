class Node
  attr_accessor :value, :left, :right

  def initialize(value, left, right)
    @value = value
    @left = left
    @right = right
  end

  def ==(other)
    value == other.value && left == other.left && right == other.right
  end
end

class Zipper
  attr_reader :focus

  def initialize(tree, parent: nil)
    @focus = tree
    @parent = parent
  end

  def self.from_tree(tree)
    Zipper.new(tree)
  end

  def to_tree
    if @parent
      @parent.to_tree
    else
      @focus
    end
  end

  def up
    @parent
  end

  def left
    return nil unless @focus.left

    Zipper.new(@focus.left, parent: self)
  end

  def right
    return nil unless @focus.right

    Zipper.new(@focus.right, parent: self)
  end

  def set_value(value)
    @focus.value = value

    self
  end

  def set_left(node)
    @focus.left = node

    self
  end

  def set_right(node)
    @focus.right = node

    self
  end

  def value
    @focus.value
  end

  def ==(other)
    @focus == other.focus
  end
end
