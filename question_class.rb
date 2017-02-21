class Question
  def initialize(question_text, multiple_choice, answer)
    @question_text = question_text
    @multiple_choice = multiple_choice
    @answer = answer
  end

  def multiple_choice
    @multiple_choice
  end

  def test_answer(answer)
    answer == @answer
  end
end
