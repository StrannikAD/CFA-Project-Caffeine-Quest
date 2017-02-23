class Question
  def initialize(text, multiple_choice, correct_answer)
    @text = text
    @multiple_choice = multiple_choice
    @correct_answer = correct_answer
  end
    attr_accessor :text, :multiple_choice, :correct_answer

  def test_answer(user_answer) # School passes user_answer
    if user_answer == @correct_answer
      true
    elsif user_answer != @correct_answer
      # puts "Wrong!"
      # puts "Oh no! Your caffiene levels have been depleted!"
      false
    end
  end

  def display_question
    puts Paint[@text, :cyan]
    @multiple_choice.each do |i|
      puts Paint[i, "light green"]
    end
  end
end
