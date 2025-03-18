module Diamond
  def self.make_diamond(char)
    return "A\n" if char == 'A'

    letters = ('A'..char).to_a
    max_width = letters.size * 2 - 1

    rows = letters.each_with_index.map do |letter, i|
      if i.zero?
        letter.center(max_width)
      else
        (letter + ' ' * (i * 2 - 1) + letter).center(max_width)
      end
    end

    (rows + rows.reverse[1..]).join("\n") + "\n"
  end
end
