class School
  def initialize(player, rooms)
    @player = player
    @rooms = rooms

    @intro_text = Paint["Welcome to Caffeine Quest(TM)!", "purple"]
    @tutorial_text = Paint[%{
Caffeine Quest(TM) is a script adventure game - shoutout to the 90s, sans Y2K?

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
 }, "cyan"]
    @invalid_input_text = Paint["Command not found. Please try again.", "purple"]
    @success_text = Paint["You were CORRECT!", "purple"]
    @failure_text = Paint["You were WRONG! Try again.", "purple"]
    @defeat_text = Paint[%{
 ______________________________________________________________________________________________
|                                                                                              |
|               You did your best but it wasn't good enough.                                   |
|               You've deen TOTALLY DECAFFEINATED! Try again to redeem yourself.               |
|______________________________________________________________________________________________|
    }, "cyan"]
    @victory_text = Paint[%{
 ______________________________________________________________________________________________
|                                                                                              |
|               Nice job! You WON!                                                             |
|               You have restored caffeine levels to 103%                                      |
|                                                                                              |
|               REWARDS:                                                                       |
|               You are now eligible for a Caffeine Quest(TM) sticker!                         |
|               -Lodge inquiries with CFA.                                                   |
|______________________________________________________________________________________________|
    }, "cyan"]

    @game_end_text = Paint[%{
  _____________________________________________________________________________________________
|                                                                                              |
|               Thank you for playing Caffeine Quest(TM)!                                      |
|               May you always have a hipster cafe to recover in wherever you go.              |
|                                                                                              |
|               This game brought to you by the following legends:                             |
|               StrannikAD                                                                     |
|               hannahcancode                                                                  |
|               advaitju                                                                       |
|                                                                                              |
|               https://github.com/advaitju/CFA-Project-Caffeine-Quest                         |
|               \u2726 Follow + Star + Watch us on Github \u2726                                         |
|______________________________________________________________________________________________|
    }, "cyan"]
    @caffeine_quest_wordmark = Paint[%{
 _______________________________________________________________________________________________
|                 ______      ________     _               ____                  __             |
|      ________  / ____/___ _/ __/ __/__  (_)___  ___     / __ \\__  _____  _____/ /_            |
|       ______  / /   / __ `/ /_/ /_/ _ \\/ / __ \\/ _ \\   / / / / / / / _ \\/ ___/ __/            |
|     _______  / /___/ /_/ / __/ __/  __/ / / / /  __/  / /_/ / /_/ /  __(__  ) /_              |
|              \\____/\\__,_/_/ /_/  \\___/_/_/ /_/\\___/   \\___\\_\\__,_/\\___/____/\\__/              |
|_______________________________________________________________________________________________|
            }, "gold"]
    @blink_prompt = Paint[">> ", :blink]
  end
  attr_accessor :player, :rooms, :blink_prompt
  # School's actions / stages of gameplay
  def start
    puts @caffeine_quest_wordmark
    puts @intro_text
    puts @tutorial_text
    @player.alive = true
    player_entered_room
  end

  def rick_roll
    system('say "never gonna give you up, never gonna let you down, never gonna turn around and hurt you"')
  end

  def player_entered_room
    @player.location.display_description
  end

  # Inifinite loop that runs till user enters 'quit'
  def player_prompt
    while true
      if !@player.alive
        puts @defeat_text
        @player.user_dies
        if !game_restart(:prompt)
          break
        end
      end
      if @player.location == @rooms[-1]
        if !player_command_leave
          break
        end
      end
      puts ""
      @player.display_caffeine_level
      print "Input ('h' for help) #{@blink_prompt} "
      input = gets.chomp.downcase
      puts ""
      system "clear"

      case input
      when "leave"
        if !player_command_leave
          break
        end
      when "look"
        player_command_look
      when "restart"
        game_restart(:no_prompt)
      when "h"
        puts @tutorial_text
      when "quit"
        break
      when "godmode"
        rick_roll
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
    print "Answer (enter A, B, C etc.) #{@blink_prompt} "
    input = gets.chomp.downcase
    puts ""
    if @player.location == @rooms[-1]
      puts @victory_text
      return game_restart(:prompt)
    else
      if @player.location.question.test_answer(input)
        puts @success_text
        @player.change_location(@player.location.next_location)
        puts ""
        player_entered_room
      else
        @player.deplete_caffeine
        puts @failure_text
      end
    end
    return true
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
      while true
        puts ""
        print "Restart [y/n]? #{@blink_prompt} "
        input = gets.chomp.downcase
        puts ""

        case input
        when 'y' || 'yes'
          break
        when 'n' || 'no'
          return false
        else
          @invalid_input_text
        end
      end
    end
    @player.restart(@rooms[0])
    start
    true
  end
end
