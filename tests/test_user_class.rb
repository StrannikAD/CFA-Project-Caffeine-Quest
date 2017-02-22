require "test/unit"
require_relative "../player_class"

class UserTest < Test::Unit::TestCase

  def test_caffeine_level_depletes
    player = Player.new("Player 1", "room 1")
    player.deplete_caffeine
    assert_equal 90, player.caffeine
  end
end
