class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    scores.last
  end

  def max_score
    scores.max
  end

  def personal_best
    max_score
  end

  def personal_top_three
    scores.sort { |a, b| b <=> a }.first(3)
  end

  def latest_is_personal_best?
    scores.last == max_score
  end

end
