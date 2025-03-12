=begin
Write your code for the 'Bob' exercise in this file. Make the tests in
`bob_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bob` directory.
=end

module Bob
  def self.hey(remark)
    shouting = remark == remark.upcase && remark =~ /[A-Z]/
    questioning = remark =~ /\?\s*\z/
    silence = remark.gsub(/\s/, '').empty?

    if silence
      "Fine. Be that way!"
    elsif shouting && questioning
      "Calm down, I know what I'm doing!"
    elsif shouting
      "Whoa, chill out!"
    elsif questioning
      "Sure."
    else
      "Whatever."
    end
  end
end
