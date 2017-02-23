class Room
  def initialize(name, description, question, next_location, npc_text)
    @name = name
    @description = description
    @question = question
    @next_location = next_location
    @npc_text = npc_text
  end

  attr_accessor :name, :description, :task, :question, :next_location, :npc_text

  # def display_task
  #   puts "You need to do #{@task} before you can proceed..."
  # end

  def display_npc_text
    puts Paint[@npc_text, "purple"]
  end
  def display_description
    puts Paint["You are in the #{@name}.", :cyan]
    puts Paint["#{@description}", "light green"]
  end

end
