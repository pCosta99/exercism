class Node
  attr_accessor :value, :next, :previous

  def initialize(value, ptr: nil, previous: nil)
    @value = value
    @next = ptr
    @previous = previous
  end
end

class Deque
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def push(value)
    node = Node.new(value, ptr: nil, previous: @tail)

    if @tail.nil?
      @head = @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  def pop
    return nil if @tail.nil?

    value = @tail.value

    if @head == @tail
      @head = @tail = nil
    else
      @tail = @tail.previous
      @tail.next = nil
    end

    value
  end

  def shift
    return nil if @head.nil?

    value = @head.value

    if @head == @tail
      @head = @tail = nil
    else
      @head = @head.next
      @head.previous = nil
    end

    value
  end

  def unshift(value)
    node = Node.new(value, ptr: @head, previous: nil)

    if @head.nil?
      @head = @tail = node
    else
      @head.previous = node
      @head = node
    end
  end
end
