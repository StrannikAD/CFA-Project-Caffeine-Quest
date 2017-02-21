class Room
  def initialize(name, description, next_location)
    @name = name
    @description = description
    @task = task
    @question = question
    @next_location = next_location
  end

  attr_accessor :name, :description, :task

  def display_task
    puts "You need to do #{@task} before you can proceed..."
  end

end
