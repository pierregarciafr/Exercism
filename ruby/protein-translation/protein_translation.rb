# class InvalidCodonError < StandardError
# 

InvalidCodonError = Class.new(StandardError)

class Codon

  attr_reader :polypeptide

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
    # p "Codon.codon : #{codon}"
    @polypeptide = CODONS[codon]
  end
end

class Translation

    private

    def initialize(codon)
      @codon = codon
    end

    def ending_codon?(string)
      of_codon == 'STOP'
    end

    public

    def of_codon
      Codon.new(@codon).polypeptide
    end

    def self.of_codon(codon)
      new(codon).of_codon
    end

    def self.of_rna(strand)

      strand.chars.each_slice(3).with_object([]) do |codon, result|
        translated_codon = Translation.of_codon(codon.join)

        if translated_codon == 'STOP'
          return result
        else
          raise InvalidCodonError, "Incorrect codon" if translated_codon.nil?
          result << translated_codon
        end
      end   
    end

end

if $PROGRAM_NAME == __FILE__
  # puts Translation.of_codon("UGG")
  # %w(UCU UCC UCA UCG).each do |codon|
  #   p Translation.of_codon(codon) # assert_equal 'Serine',
  # end

    # strand = 'AUGUUUUGG'
    # expected = %w(Methionine Phenylalanine Tryptophan)
    # p Translation.of_rna(strand)

    # strand = 'AUGUUUUAA'
    # expected = %w(Methionine Phenylalanine)
    # p Translation.of_rna(strand)

  p Translation.of_rna('CARROT') # 
  # p Translation.of_rna('AUGUUUUAA') # cas STOP
   # p Translation.of_rna('AUGUUUUGG') # cas until result.empty?

end