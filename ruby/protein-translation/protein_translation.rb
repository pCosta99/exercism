class InvalidCodonError < StandardError
end

module Translation
  CODONS = {
    aug: :methionine,
    uuu: :phenylalanine,
    uuc: :phenylalanine,
    uua: :leucine,
    uug: :leucine,
    ucu: :serine,
    ucc: :serine,
    uca: :serine,
    ucg: :serine,
    uau: :tyrosine,
    uac: :tyrosine,
    ugu: :cysteine,
    ugc: :cysteine,
    ugg: :tryptophan,
    uaa: :stop,
    uag: :stop,
    uga: :stop
  }

  def self.of_rna(strand)
    rna = []

    strand.chars.each_slice(3).each do |slice|
      aminoacid = CODONS[slice.join.downcase.to_sym]

      raise InvalidCodonError if aminoacid.nil?

      break if aminoacid == :stop

      rna << aminoacid.to_s.capitalize
    end

    rna
  end
end

