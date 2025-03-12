=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

require 'debug'

class DndCharacter
  BASE_HITPOINTS = 10
  ATTRIBUTES = %i[strength dexterity constitution intelligence wisdom charisma].freeze

  attr_reader :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma

  def self.modifier(constitution)
    ((constitution - 10) / 2.to_f).floor
  end

  def self.generate
    rolls = []

    4.times do
      rolls << rand(1..6)
    end

    rolls.max(3).sum
  end

  def initialize
    ATTRIBUTES.each do |attribute|
      instance_variable_set("@#{attribute}", self.class.generate)
    end
  end

  def hitpoints
    BASE_HITPOINTS + self.class.modifier(constitution)
  end
end
