module RotationalCipher
  LOWER = ('a'..'z').to_a
  UPPER = ('A'..'Z').to_a

  def self.rotate(text, shift)
    text.tr(LOWER.join + UPPER.join, LOWER.rotate(shift).join + UPPER.rotate(shift).join)
  end
end
