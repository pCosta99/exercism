=begin
Write your code for the 'Allergies' exercise in this file. Make the tests in
`allergies_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/allergies` directory.
=end

class Allergies
  ALLERGENS = %w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]

  def initialize(n)
    @allergens = n.to_s(2).chars.map(&:to_i).reverse
  end

  def allergic_to?(allergen)
    @allergens[ALLERGENS.index(allergen)]&.positive?
  end

  def list
    ALLERGENS.each_with_index.filter_map { |allergen, i| allergen if @allergens[i]&.positive? }
  end
end
