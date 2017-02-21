class User
  def initialize(name, current_room, hints)
    @name = name
    @starting_room = current_room
    @room = current_room
  end

  def next_room(room)
    if room == @room
      false
    end
    @room = room
    true
  end

  def restart
    @room = starting_room
  end

end
