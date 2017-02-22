require "test/unit"
require_relative "../player_class"

class UserTest < Test::Unit::TestCase

  # def test_player_displays_caffeine_level
  #   player = Player.new("Player 1", "room 1")
  #   assert_equal "Your current caffeine level is 100%", player.display_caffeine_level
  # end

  def test_caffeine_level_depletes
    player = Player.new("Player 1", "room 1")
    player.deplete_caffeine
    assert_equal 90, player.caffeine
  end
end
