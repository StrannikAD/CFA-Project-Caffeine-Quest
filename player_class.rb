class Player
  def initialize(name, location)
    @name = name
    @location = location
    @caffeine = 100
    @alive = true
  end

  attr_accessor :name, :location, :caffeine

  def change_location(location)
    @location = location
  end

  def restart(location)
    @location = location
    @caffeine = 100
  end

  def deplete_caffeine
    if @caffeine - 10 > 0
      @caffeine -= 10
      puts "Oh no! Your caffeine level has dropped by 10%!"
      puts display_caffeine_level
    else
      @alive = false

  end

  def display_caffeine_level
    puts "Your current caffeine level is #{caffeine}%"
  end

  def user_dies
    system('say "you are deeeeeeead"')
  end

end
