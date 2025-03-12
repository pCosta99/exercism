module BottleSong
  def self.recite(initial, verses)
    template = <<~TEXT
      %<starting>s green %<starting_bottles>s hanging on the wall,
      %<starting>s green %<starting_bottles>s hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be %<final>s green %<final_bottles>s hanging on the wall.
    TEXT

    1.upto(verses).map do |n|
      starting = i_to_s(initial - n + 1).capitalize
      final = i_to_s(initial - n)
      starting_bottles = starting == 'One' ? 'bottle' : 'bottles'
      final_bottles = final == 'one' ? 'bottle' : 'bottles'

      format(template, starting:, final:, starting_bottles:, final_bottles:)
    end.join("\n")
  end

  def self.i_to_s(n)
    %w[no one two three four five six seven eight nine ten][n]
  end
end
