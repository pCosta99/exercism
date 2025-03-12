class WordProblem
  OPERATIONS = {
    plus: :+,
    minus: :-,
    multiplied: :*,
    divided: :/
  }

  def initialize(question)
    @tokens = question.scan(/-?\d+|(?<=\d )\w+/)
  end

  def answer
    raise ArgumentError if @tokens.empty?

    @tokens[1..].each_slice(2).reduce(@tokens.first.to_i) do |acc, (num_or_op, num)|
      raise ArgumentError unless OPERATIONS.key?(num_or_op.to_sym)

      acc.send(OPERATIONS[num_or_op.to_sym], num.to_i)
    end
  end
end
