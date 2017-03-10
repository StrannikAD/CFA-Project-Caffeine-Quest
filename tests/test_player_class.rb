require "test/unit"
require_relative "../player_class"

class PlayerTest < Test::Unit::TestCase

  def test_player_class
    player = Player.new("Charles", "kitchen")
    actual = player.name
    expected = "Charles"
    assert_equal(expected, actual)
  end

  def test_caffeine_level_depletes
    player = Player.new("Player 1", "room 1")
    player.deplete_caffeine
    assert_equal 80, player.caffeine
  end

end
