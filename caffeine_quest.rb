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
    "d) organising"], "b")

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
cafe = Room.new("Cafe", "You did it!!\n\nYou will now receive a year's supply of take away coffee! j/k Reaching caffeine enlightenment is a reward in itself\n\nMay Java be with you!", cafe_question, nil)
stairwell = Room.new("Stairwell", "The stairwell lights are eerily flickering on and off and was that a mouse \nthat just ran across your foot?\n\nBut the end is in sight, caffeine awaits beyond this door!", question5, cafe)
printerroom = Room.new("Printer Room", "Disaster!\n\nThe printer has malfunctioned and is printing out pages at random.\n\nEscape!", question4, stairwell)
kitchen = Room.new("Kitchen", "The kitchen is full to the brim with Year 9 students and there is no caffeine in sight.\n\nBeat a hasty retreat!", question3, printerroom)
makerspace = Room.new("Maker Space", "There's a VR headset discarded on the floor\n - no doubt another unsuspecting student has fallen victim to the high beam jump!\n\nWhat sort of devilry is afoot?", question2, kitchen)
classroom = Room.new("Classroom", "You have been working on your project for hours and are starting to get tired\n - time to get some caffeine.\n\nSuddenly the steady hum of computers is drowned out by a shriek in the adjoining room.\n\nPress \"LEAVE\' to investigate.", question1, makerspace)


player = Player.new("Player One", classroom)

school = School.new(player, [classroom, makerspace, kitchen, printerroom, stairwell, cafe])
