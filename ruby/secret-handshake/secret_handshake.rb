class SecretHandshake

  COMMAND = { 0 => 'wink',
  	          1 => 'double blink',
  	          2 => 'close your eyes',
  	          3 => 'jump'
            }

  def initialize(decimal_number)
  	@binary_value = decimal_number.to_i.to_s(2).chars.map(&:to_i).reverse
  end

  def commands
  	result = @binary_value.each_with_index.map do |digit, index|
  	  COMMAND[index] if digit == 1
    end.compact
    @binary_value[4] == 1 ? result.reverse : result
  end
end

if $PROGRAM_NAME == __FILE__
  p SecretHandshake.new(19).commands
  p SecretHandshake.new('piggies').commands
end