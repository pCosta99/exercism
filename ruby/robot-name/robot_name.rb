class Robot
  @@all_names = ('AA'..'ZZ').to_a.product(('000'..'999').to_a).map(&:join).shuffle
  @@reserved_names = Set.new

  attr_reader :name

  def initialize
    generate_name
  end

  def reset
    generate_name
  end

  def self.forget
    @@reserved_names.clear
    @@all_names = ('AA'..'ZZ').to_a.product(('000'..'999').to_a).map(&:join).shuffle
  end

  private

  def generate_name
    raise 'No available names left!' if @@all_names.empty?

    new_name = @@all_names.pop
    @@reserved_names << new_name
    @name = new_name
  end
end
