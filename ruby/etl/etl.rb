=begin
Write your code for the 'ETL' exercise in this file. Make the tests in
`etl_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/etl` directory.
=end

module ETL
  def self.transform(old)
    hash = {}

    old.each do |value, letters|
      letters.each do |letter|
        hash[letter.downcase] = value
      end
    end

    hash
  end
end
