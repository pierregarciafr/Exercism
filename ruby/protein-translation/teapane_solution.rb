class InvalidCodonError < StandardError; end

module Translation

  class << self

    private

    def lookups
      { ['AUG'] => 'Methionine',
        ['UUU', 'UUC'] => 'Phenylalanine',
        ['UUA', 'UUG'] => 'Leucine',
        ['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
        ['UAU', 'UAC'] => 'Tyrosine',
        ['UGU', 'UGC'] => 'Cysteine',
        ['UGG'] => 'Tryptophan',
        ['UAA', 'UAG', 'UGA'] => 'STOP'
      }
    end

    public

  	def of_codon(codon)
  		result = lookups.keys.find {|sequence| sequence.include?(codon)}
  		raise InvalidCodonError if lookups[result].nil?
  		lookups[result]
  	end

  	def of_rna(strand)
  		strand.chars.each_slice(3).with_object([]) do |codon, result|
  			return result if lookups[codon.join] == 'STOP'
  			result << of_codon(codon.join)
  		end
  	end


  end
end

if $PROGRAM_NAME == __FILE__
  # p Translation.of_codon("UGG")
  # p Translation.of_rna('CARROT') # 
  # p Translation.of_rna('AUGUUUUAA') # cas STOP
   p Translation.of_rna('AUGUUUUGG') # cas until result.empty?

end