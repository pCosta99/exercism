module Dominoes
  State = Struct.new(:path, :remaining)

  def self.chain?(dominoes)
    return true if dominoes.empty?
    return false if dominoes.length == 1 && dominoes.first[0] != dominoes.first[1]

    dominoes.permutation.any? do |perm|
      next unless (perm[0] & perm[-1]).any?

      perm.each_cons(2).all? { |dc| (dc[0] & dc[1]).any? }
    end
  end
end
