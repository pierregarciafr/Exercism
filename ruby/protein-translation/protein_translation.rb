# class InvalidCodonError < StandardError
# 

InvalidCodonError = Class.new(StandardError)

class Codon

  attr_reader :codon_acid
  
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

  def initialize(codon)
    p "Codon.codon : #{codon}"
    @codon_acid = CODONS[codon]
  end
end

class Translation

    private

    def initialize(codon)
      @codon = codon
      # @codon = codon.chars.each_slice(3).with_object([]) do |slice, result|
      #   result << slice.join
      # end
    end

    def ending_codon?
      of_codon == 'STOP'
    end

    # def valid_codons?
    #   valid_length?(@codon) && valid_letters?(@codon)
    # end

    # def valid_length?
    #   @codon.length % 3 == 0
    # end

    # def valid_letters?
    #   @codon.join.match(/[AUCG]*/)[0] == strand
    # end

    def generate_result
      p "codon: #{@codon}"
      result = @codon.map do |codon_shortcut|
      	# if ending_codon?(codon_shortcut)
      	#   return result
      	# else
        p "codon_shortcut: #{codon_shortcut}"
      	  Translation.of_codon(codon_shortcut)
          
        # end
      end
      p "result : #{result}"
    end

    public

    def of_codon
      p @codon
      Codon.new(@codon).codon_acid
    end

    def self.of_codon(codon)
      new(codon).of_codon
    end

    # def of_rna
    #   p @codon
    #   # raise InvalidCodonError, "Incorrect codon" if !valid_codons?

  	 #  generate_result
    # end

    # def self.of_rna(strand)
    #   new(strand).of_rna
    # end

end

if $PROGRAM_NAME == __FILE__
  # puts Translation.of_codon("UGG")
  %w(UCU UCC UCA UCG).each do |codon|
    p Translation.of_codon(codon) # assert_equal 'Serine',
  end

    # strand = 'AUGUUUUGG'
    # expected = %w(Methionine Phenylalanine Tryptophan)
    # p Translation.of_rna(strand)

  # p Translation.of_rna('CARROT') # 
  # p Translation.of_rna('AUGUUUUAA') # cas STOP
   # p Translation.of_rna('AUGUUUUGG') # cas until result.empty?

end