class User
  def initialize(name)
    @name = name
  end

  attr_accessor :name
end

class Room
  def initialize()
  end
end

class Question
  def initialize(question, multiple_choice, correct)
    @question = question
    @answer = ""
    @multiple_choice = multiple_choice
    @correct = correct
  end
  attr_accessor :question, :multiple_choice, :correct
end


question1 = Question.new("question", ["choice1","choice2"], 1)

puts question1.multiple_choice[question1.correct]
