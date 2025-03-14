class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @size = size
    @buffer = Array.new(size)
    @head = 0
    @tail = 0
    @count = 0
  end

  def read
    raise BufferEmptyException if empty?

    data = @buffer[@head]
    @buffer[@head] = nil
    @head = (@head + 1) % @size
    @count -= 1

    data
  end

  def write(data)
    raise BufferFullException if full?

    @buffer[@tail] = data
    @tail = (@tail + 1) % @size
    @count += 1
  end

  def write!(data)
    read if full?
    write(data)
  end

  def clear
    @head = @tail = @count = 0
    @buffer.fill(nil)
  end

  private

  def full?
    @count == @size
  end

  def empty?
    @count.zero?
  end
end
