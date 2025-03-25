module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city[0, 4].upcase.to_sym
  end

  def self.get_terminal(id)
    id.to_s[/OIL|GAS/] ? :A : :B
  end
end
