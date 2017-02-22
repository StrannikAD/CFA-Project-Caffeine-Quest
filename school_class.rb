class School
  def initialize(player, rooms)
    @player = player
    @rooms = rooms

    @intro_text = "Welcome to Caffeine Quest!"
    @tutorial_text = "These are the commands you can enter: ..."
    @success_text = "You were correct!"
    @failure_text = "You were wrong! Try again."
    @caffeine_quest_wordmark = %{
                 ______      ________     _               ____                  __
      ________  / ____/___ _/ __/ __/__  (_)___  ___     / __ \\__  _____  _____/ /_
       ______  / /   / __ `/ /_/ /_/ _ \\/ / __ \\/ _ \\   / / / / / / / _ \\/ ___/ __/
     _______  / /___/ /_/ / __/ __/  __/ / / / /  __/  / /_/ / /_/ /  __(__  ) /_
              \\____/\\__,_/_/ /_/  \\___/_/_/ /_/\\___/   \\___\\_\\__,_/\\___/____/\\__/  }

    start
    player_prompt
  end

  # School's actions / stages of gameplay
  def start
    puts @caffeine_quest_wordmark
    puts @intro_text
    puts @tutorial_text
  end

  def display_current_location
  end

  def prompt_user
  end

  attr_accessor :player
end
