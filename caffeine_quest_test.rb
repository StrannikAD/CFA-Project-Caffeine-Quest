require 'test/unit'
require_relative 'caffeine_quest'

class QuestionTest < Test::Unit::TestCase
  def test_question_class
    question = Question.new("question text", [], 1)
    actual = question.question
    expected = "question text"
    assert_equal(expected, actual)
  end
end
