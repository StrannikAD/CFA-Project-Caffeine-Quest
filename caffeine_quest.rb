require_relative "school_class"
require_relative "player_class"
require_relative "room_class"
require_relative "question_class"
require "paint"
# require "catpix"

question1 = Question.new("Ruby on Rails is a ____",
  ["a. web framework",
    "b. programming environment",
    "c. programming language",
    "d. all of the above"], "a")

question2 = Question.new("What does the following expression evaluate to?: 2 ** 4",
  ["a. 8", "b. 12", "c. 16", "d. 14"], "c")

question3 = Question.new("Which one of the following ruby code create the string \"Hello Ruby\"?",
  ["a. %{Hello Ruby%",
    "b. @Hello Ruby",
    "c. %(Hello Ruby)",
    "d. %Hello Ruby!"], "c")

question4 = Question.new("An object contains which of the following?",
  ["a) data and methods",
    "b) methods and conditionals",
    "c) conditionals and frameworks",
    "d) frameworks and data"], "a")

question5 = Question.new("The name for the way that computers manipulate data into information is called:",
  ["a) programming",
    "b) processing",
    "c) storing",
    "d) organising"], "a")

question6 = Question.new("Ruby is an ____ interpreted scripting language.",
  ["a) object-oriented",
    "b) binary",
    "c) awesome",
    "d) logical"], "a")

cafe_question = Question.new("Welcome to Cafe Hipst! You look exhausted, can I get you a coffee?",
  ["a) a flat white please",
    "b) long black, milk on the side",
    "c) single origin V60 filter please",
    "d) Ethiopian cold drip",
    "e) I could murder a Nescafe Blend 43"], "e")

#rooms need to be made backwards so they can feed into the next_location of their previous room
cafe = Room.new("Cafe", "description", cafe_question, nil)
stairwell = Room.new("Stair Well", "description", question5, cafe)
printerroom = Room.new("Printer Room", "description", question4, stairwell)
kitchen = Room.new("Kitchen", "description", question3, printerroom)
makerspace = Room.new("Maker Space", "description", question2, kitchen)
classroom = Room.new("Classroom", "description", question1, makerspace)


player = Player.new("Player One", classroom)

school = School.new(player, [classroom, makerspace, kitchen, printerroom, stairwell, cafe])
