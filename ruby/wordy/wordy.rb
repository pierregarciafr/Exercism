class WordProblem

  NEUTRALS = %w(What is by)

  private

  def initialize(sentence)
    arguments = sentence[0...-1].split(' ') - NEUTRALS
    @first_value = arguments.shift.to_i
    @blocks = arguments.each_slice(2).with_object([]) do |slice, array|
      array << { operator: slice[0], value: slice[1].to_i }
    end
  end

  public

  def answer
    @blocks.inject(@first_value) do |value, block|
      case block[:operator]
        when 'plus'
          value + block[:value]
        when 'minus'
          value - block[:value]
        when 'multiplied'
          value * block[:value]
        when 'divided'
          value / block[:value]
        else
          raise ArgumentError, "Unknow operation"
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  p WordProblem.new("What is 52 cubed?")
  p WordProblem.new("What is 52 cubed?").answer
end