# class InvalidCodonError < StandardError
# 

InvalidCodonError = Class.new(StandardError)

module Translation

  class << self

    CODONS = { 'AUG' => 'Methionine',
               'UUU' => 'Phenylalanine', 'UUC' => 'Phenylalanine',
               'UUA' => 'Leucine',       'UUG' => 'Leucine',
               'UCU' => 'Serine',        'UCC' => 'Serine',
               'UCA' => 'Serine',        'UCG' => 'Serine',
               'UAU' => 'Tyrosine',      'UAC' => 'Tyrosine',
               'UGU' => 'Cysteine',      'UGC' => 'Cysteine',
               'UGG' => 'Tryptophan',
               'UAA' => 'STOP',         'UAG' => 'STOP',         'UGA' => 'STOP'
             }

    private

    def ending_codon?(codon)
      of_codon(codon) == 'STOP'
    end

    def valid_codons?(strand_array)
      valid_length?(strand_array) && valid_letters?(strand_array.join)
    end

    def valid_length?(strand_array)
      strand_array.length % 3 == 0
    end

    def valid_letters?(strand)
      strand.match(/[AUCG]*/)[0] == strand
    end

    def generate_result(strand_array)
      strand_array.each_slice(3).with_object([]) do |slice, result|
      	if ending_codon?(slice.join)
      	  return result 
      	else
      	  result << of_codon(slice.join)
        end
      end
    end

    public

    def of_codon(codon)
      CODONS[codon]
    end

    def of_rna(strand)
      strand_array = strand.chars
      raise InvalidCodonError, "Incorrect codon" if !valid_codons?(strand_array)

  	  generate_result(strand_array)
    end

  end
end

if $PROGRAM_NAME == __FILE__
  # puts Translation.of_codon("UGG")
  # p Translation.of_rna('CARROT') # 
  p Translation.of_rna('AUGUUUUAA') # cas STOP
   # p Translation.of_rna('AUGUUUUGG') # cas until result.empty?

end