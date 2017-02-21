class User
  def initialize(name)
    @name = name
  end

  attr_accessor :name

  def deplete_caffeine
  end

  def change_location
  end
end

class School
  def initialize(player)
    @player = player
    @rooms = []
  end

  attr_accessor :player
end

class Room
  def initialize()
    @name = name
    @description = description
    @task = task
    @question = question
  end

  attr_accessor :name, :description, :task



  def display_task
  end
end

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

def user_dies()
  #system('say "oh no you are deeeeeeead."')
end
