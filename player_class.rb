class Player
  def initialize(name, location)
    @name = name
    @location = location
    @caffeine = 100
    @alive = true
    @caffeine_deplete_by = 20
  end

  attr_accessor :name, :location, :caffeine, :alive

  def change_location(location)
    @location = location
  end

  def restart(location)
    @location = location
    @caffeine = 100
  end

  def deplete_caffeine
    if @caffeine - @caffeine_deplete_by > 0
      @caffeine -= @caffeine_deplete_by
      puts "Oh no! Your caffeine level has dropped by #{@caffeine_deplete_by}%!"
    else
      @alive = false
    end
  end

  def display_caffeine_level
    puts "Your current caffeine level is #{@caffeine}%"
  end

  def user_dies
    system('say "oh no"')
  end

end
