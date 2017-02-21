class Question
  def initialize(question_text, multiple_choice, answer, hint)
    @question_text = question_text
    @multiple_choice = multiple_choice
    @answer = answer
    @hint = hint
  end

  def hint
    @hint
  end

  def multiple_choice
    @multiple_choice
  end

  def test_answer(answer)
    answer == @answer
  end
end
