module Bob
  ANSWERS = {
    question: "Sure.",
    yells: "Whoa, chill out!",
    yelled_question: "Calm down, I know what I'm doing!",
    blank: 'Fine. Be that way!',
    else: 'Whatever.'
  }
  class << self
    def hey(string)
      return ANSWERS[:yelled_question] if question?(string) && yell?(string)
      return ANSWERS[:question] if question?(string)
      return ANSWERS[:yells] if yell?(string)
      return ANSWERS[:blank] if blank?(string)
      return ANSWERS[:else]
    end

    def question?(str)
      str.rstrip[-1] == '?'
    end

    def yell?(str)
      str.scan(/[A-Z]/).count > str.scan(/[a-z]/).count
    end

    def blank?(str)
      str.strip.empty?
    end
  end
end
