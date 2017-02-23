class School
  def initialize(player, rooms)
    @player = player
    @rooms = rooms

    @intro_text = "Welcome to Caffeine Quest!\n\n"
    @tutorial_text = %{Caffeine Quest is a script adventure game - shoutout to the 90s, sans Y2K?

You interact with the game by typing in commands. Fingerless-gloves. Activate!

Commands are case-insensitive:
LOOK - Get information about current room.
LEAVE - Answer question to leave current room and progress.
H - View these tips again.
RESTART - Another one. -DJ Khaled
QUIT - If you must :(
GODMODE - Anything, but this...

 ______________________________________________________________________________________________
|                                                                                              |
|              HOW TO WIN:                                                                     |
|              You start with a caffeine level of 100%. But you need more.                     |
|              CoderFactory students have blocked all exits.                                   |
|              Answer their riddles to get to the cafe that only does handle bars latte art.   |
|              Wrong answers decaffeinate you! Do not get TOTALLY DECAFFEINATED !! ?? !        |
|______________________________________________________________________________________________|
}
    @invalid_input_text = "Command not found. Please try again."
    @success_text = "You were CORRECT!"
    @failure_text = "You were WRONG! Try again."
    @defeat_text = %{
 ______________________________________________________________________________________________
|                                                                                              |
|               You did your best but it wasn't good enough.                                   |
|               You've deen TOTALLY DECAFFEINATED! Try again to redeem yourself.               |
|______________________________________________________________________________________________|
    }
    @victory_text = %{
 ______________________________________________________________________________________________
|                                                                                              |
|               Nice job! You WON!                                                             |
|               You have restored caffeine levels to 103%                                      |
|                                                                                              |
|               REWARDS:                                                                       |
|               You are now eligible for a Caffeine Quest(TM) sticker!                         |
|               -Lodge inquiries with Jamie.                                                   |
|______________________________________________________________________________________________|
    }

    @game_end_text = %{
  _____________________________________________________________________________________________
|                                                                                              |
|               Thank you for playing Caffeine Quest!                                          |
|               May you always have a hipster cafe to recover in wherever you go.              |
|                                                                                              |
|               This game brought to you by the following legends:                             |
|               StrannikAD                                                                     |
|               hannahcancode                                                                  |
|               advaitju                                                                       |
|                                                                                              |
|               https://github.com/advaitju/CFA-Project-Caffeine-Quest                         |
|               \u2726 Follow + Star + Watch us on Github \u2726                                          |
|______________________________________________________________________________________________|
    }
    @caffeine_quest_wordmark = %{
 _______________________________________________________________________________________________
|                 ______      ________     _               ____                  __             |
|      ________  / ____/___ _/ __/ __/__  (_)___  ___     / __ \\__  _____  _____/ /_            |
|       ______  / /   / __ `/ /_/ /_/ _ \\/ / __ \\/ _ \\   / / / / / / / _ \\/ ___/ __/            |
|     _______  / /___/ /_/ / __/ __/  __/ / / / /  __/  / /_/ / /_/ /  __(__  ) /_              |
|              \\____/\\__,_/_/ /_/  \\___/_/_/ /_/\\___/   \\___\\_\\__,_/\\___/____/\\__/              |
|_______________________________________________________________________________________________|
            }

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
    while true
      if false
        puts @defeat_text
        if !game_restart(:prompt)
          break
        end
      end
      puts ""
      print "Input ('h' for help) >> "
      input = gets.chomp.downcase
      puts ""

      case input
      when "leave"
        player_command_leave
      when "look"
        player_command_look
      when "restart"
        game_restart(:no_prompt)
      when "h"
        puts @tutorial_text
      when "quit"
        break
      else
        puts @invalid_input_text
      end
    end
    puts @game_end_text
    puts @caffeine_quest_wordmark
  end

  # Player commands
  ## LEAVE
  def player_command_leave
    @player.location.question.display_question
    print "Answer (enter A, B, C etc.) >> "
    input = gets.chomp.downcase
    puts ""
    if @player.location.question.test_answer(input)
      if @player.location == @rooms[-1]
        puts @victory_text
        game_restart(:prompt)
      end
      puts @success_text
      @player.change_location(@player.location.next_location)
      puts ""
      player_entered_room
    else
      @player.deplete_caffeine
      puts @failure_text
    end
  end

  ## LOOK
  def player_command_look
    @player.location.display_description
  end

  ## ~ EXAMINE [item]

  ## ~ Cheats / Easter eggs

  # Game logic
  def game_restart(prompt)
    if prompt == :prompt
      puts ""
      print "Restart [y/n]? >> "
      input = gets.chomp.downcase
      puts ""

      case input
      when 'y' || 'yes'
        game_restart
      when 'n' || 'no'
        return
      else
        @invalid_input_text
      end
    end
    start
    @player.restart(@rooms[0])
    player_entered_room
  end
end
