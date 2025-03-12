=begin
Write your code for the 'Binary Search' exercise in this file. Make the tests in
`binary_search_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search` directory.
=end

class BinarySearch
  def initialize(array)
    @array = array
  end

  def search_for(n)
    lower_i = 0
    upper_i = @array.length - 1

    until upper_i < lower_i
      i = lower_i + ((upper_i - lower_i) / 2)

      x = @array[i]

      return i if x == n

      if x > n
        upper_i = i - 1
      else
        lower_i = i + 1
      end
    end
  end
end
