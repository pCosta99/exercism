require 'debug'

class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum)
    @datum = datum
    @next = nil
  end
end

class SimpleLinkedList
  def initialize(arr = [])
    arr.each { |n| push(Element.new(n)) }
  end

  def push(element)
    raise ArgumentError unless element.is_a?(Element)

    element.next = @head
    @head = element

    self
  end

  def pop
    current_head = @head
    @head = current_head.next if current_head

    current_head
  end

  def to_a
    arr = []
    value = @head

    until value.nil?
      arr << value.datum
      value = value.next
    end

    arr
  end

  def reverse!
    return self if @head.nil?

    previous = nil
    current = @head

    while current
      next_node = current.next
      current.next = previous
      previous = current
      current = next_node
    end

    @head = previous

    self
  end
end
