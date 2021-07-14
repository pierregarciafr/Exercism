class Complement
  DNA = "GCTA"
  RNA = "CGAU"

  def self.of_dna(strain)
    strain.tr(DNA, RNA)
  end

end

p Complement.of_dna('ACGTGGTCTTAA')
