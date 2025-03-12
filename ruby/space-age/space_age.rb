=begin
Write your code for the 'Space Age' exercise in this file. Make the tests in
`space_age_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/space-age` directory.
=end

class SpaceAge
  TIMES = {
    "Mercury" => 0.2408467,
    "Venus" => 0.61519726,
    "Earth" => 1,
    "Mars" => 1.8808158,
    "Jupiter" => 11.862615,
    "Saturn" => 29.447498,
    "Uranus" => 84.016846,
    "Neptune" => 164.79132
  }

  def initialize(seconds)
    @age = seconds / 31557600.to_f
  end

  TIMES.each do |planet, v|
    define_method :"on_#{planet.downcase}" do
      @age / v
    end
  end
end
