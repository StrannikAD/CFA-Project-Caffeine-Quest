class Room
  def initialize(name, description, question, next_location)
    @name = name
    @description = description
    @question = question
    @next_location = next_location
  end

  attr_accessor :name, :description, :task, :question

  # def display_task
  #   puts "You need to do #{@task} before you can proceed..."
  # end

  def display_description
    puts "You have entered #{name}. #{description}"
  end

end
