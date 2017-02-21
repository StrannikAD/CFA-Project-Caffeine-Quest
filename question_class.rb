class Question
  def initialize(question_text, multiple_choice, correct)
    @question_text = question_text
    @user_answer = ""
    @multiple_choice = multiple_choice
    @correct = correct
  end
  attr_accessor :question, :multiple_choice, :correct

  def test_answer
    if @user_answer == @multiple_choice[@correct]
      #user.advance_room
    else
      #user.deplete_health
    end
  end

  def display_question
    puts @question
    @multiple_choice.each do |choice|
      puts choice
    end
  end
end
