class School
  def initialize(player, rooms)
    @player = player
    @rooms = rooms

    @intro_text = "Welcome to Caffeine Quest!"
    @tutorial_text = %{
Caffeine Quest is a script adventure game - shoutout to the 90s, sans Y2K?

You interact with the game by typing in commands. Fingerless-gloves. Activate!

Commands are case-insensitive. You can enter:
LOOK - Get information about current room.
LEAVE - Answer question to leave current room and progress.
H - View these tips again.
RESTART - Low on Caffeine? Don't think you'll make it? Quit without quitting.
QUIT - If you must :(
GODMODE - Anything, but this...
    }
    @invalid_input_text = "Command not found. Please try again."
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

  def player_entered_room
    @player.location.display_description
  end

  # Inifinite loop that runs till user enters 'quit'
  def player_prompt
    loop do
      print "Input ('h' for help) >> "
      input = gets.chomp.downcase

      case input
      when "leave"
        player_command_leave
      when "look"
        player_command_look
      when "restart"
        game_restart
      when "h"
        puts @tutorial_text
      else
        puts @invalid_input_text
      end
      break if input == "quit"
    end
    puts "Thank you for playing Caffeine Quest!\nMay you always have a hipster cafe to recover in wherever you go."
    puts @caffeine_quest_wordmark
  end

  # Player commands
  ## LEAVE
  def player_command_leave
    @player.location.question.display_question
    print "Answer (enter A, B, C etc.) >> "
    input = gets.chomp.downcase
    if @player.location.question.test_answer(input)
      puts @success_text
      @player.change_location(@player.location.next_location)
    end
    puts @failure_text
  end

  ## LOOK
  def player_command_look
    @player.location.display_description
  end

  ## ~ EXAMINE [item]

  ## ~ Cheats / Easter eggs

  # Game logic
  def game_restart
    start
    @player.restart(@rooms[0])
    player_entered_room
  end
end
