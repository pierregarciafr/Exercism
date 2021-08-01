class Crypto

  private

  def initialize(plaintext)
    @filtered_text = filter(plaintext)
  end

  def filter(plaintext)
    filtered = plaintext.downcase
                        .scan(/[[:alpha:]]|[[:digit:]]/)
                        .join
    return filtered if !filtered.empty?
    ''
  end

  def array_dimensions(length)
    root = Math.sqrt(length)
    root_floor = root.to_i

    if (length % root).zero?
      [root_floor, root_floor]
    elsif (length / root_floor) <= (root_floor + 1)
      [root_floor, root_floor + 1]
    else
      [root_floor + 1, root_floor + 1]
    end
  end

  def normalize
    rows, columns = array_dimensions(@filtered_text.length)
    @filtered_text.ljust(columns * rows)
                  .chars
                  .each_slice(columns)
                  .with_object([]) do |slice, array|
                    array << slice
                  end
  end

  public

  def ciphertext
    return '' if @filtered_text.empty?

    normalize.transpose
             .map(&:join)
             .join(' ')
  end
end

if $PROGRAM_NAME == __FILE__
  plaintext = ''
  # plaintext = 'If man was meant to stay on the ground, god would have given us roots.' # "tsf hiu isn"
  plaintext = 'Chill out.'
  p Crypto.new(plaintext).ciphertext
  
end