module Brackets
  PAIRS = { '(' => ')', '[' => ']', '{' => '}' }.freeze

  def self.paired?(code)
    stack = []

    code.scan(/[\(\)\[\]\{\}]/).each do |bracket|
      if PAIRS.key?(bracket)
        stack.push(bracket)
      else
        return false if stack.empty? || PAIRS[stack.pop] != bracket
      end
    end

    stack.empty?
  end
end
