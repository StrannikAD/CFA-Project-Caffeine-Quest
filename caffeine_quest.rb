require_relative "school_class"
require_relative "player_class"
require_relative "room_class"
require_relative "question_class"

question1 = Question.new("Ruby on Rails is a ___",
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

#rooms need to be made backwards so they can feed into the next_location of their previous room
cafe = Room.new("Cafe", "description", question2, nil)
stairwell = Room.new("Stair Well", "description", question2, cafe)
printerroom = Room.new("Printer Room", "description", question2, stairwell)
kitchen = Room.new("Kitchen", "description", question2, printerroom)
makerspace = Room.new("Maker Space", "description", question2, kitchen)
classroom = Room.new("Classroom", "description", question1, makerspace)


player = Player.new("Player One", classroom)

school = School.new(player, [classroom])
