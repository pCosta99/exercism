=begin
Write your code for the 'Flatten Array' exercise in this file. Make the tests in
`flatten_array_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/flatten-array` directory.
=end

module FlattenArray
  def self.flatten(array)
    array.each_with_object([]) do |sub, acc|
      if sub.is_a?(Enumerable)
        acc.concat(flatten(sub))
      elsif sub
        acc << sub
      end
    end
  end
end
