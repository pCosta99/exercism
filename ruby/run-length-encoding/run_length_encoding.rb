require 'debug'

module RunLengthEncoding
  def self.encode(input)
    input.chars.slice_when(&:!=).map do |group|
      "#{group.size if group.size > 1}#{group.first}"
    end.join
  end

  def self.decode(input)
    input.scan(/(\d+)?([a-zA-Z\s])/).map { |count, char| char * (count ? count.to_i : 1) }.join
  end
end
