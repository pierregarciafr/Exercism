class Complement
  TRANSCRIPTION = { 'C' => 'G', 'G' => 'C', 'T' => 'A', 'A' => 'U' }.freeze
  def self.of_dna(strand)
    return '' if strand.empty?

    strand.chars.map { |letter| TRANSCRIPTION[letter] }.join
  end
end
