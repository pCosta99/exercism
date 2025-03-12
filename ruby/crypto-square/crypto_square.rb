class Crypto
  def initialize(str)
    @str = str.downcase.gsub(/\s+/, '').scan(/\w/)
    @len = @str.length
  end

  def ciphertext
    columns = Math.sqrt(@len).ceil
    rows = (@len.to_f / columns).ceil if columns.positive?

    square = Array.new(columns) do |c1|
      rows.times.each_with_object('') do |i1, row|
        row << @str.fetch(c1 + i1 * columns, ' ')
      end
    end

    square.join(' ')
  end
end
