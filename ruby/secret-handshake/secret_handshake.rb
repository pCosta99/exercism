class SecretHandshake
  ACTIONS = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(n)
    @code = n.is_a?(Integer) ? n.to_s(2).reverse.chars.map(&:to_i) : []
    @reverse = @code.length > 4
  end

  def commands
    commands = ACTIONS.zip(@code).filter { |_, n| n&.positive? }.map(&:first)

    @reverse ? commands.reverse : commands
  end
end
