require "test/unit"
require_relative "../room_class"

class RoomTest < Test::Unit::TestCase

  def test_room_class_initializes_correctly
    room = Room.new("name", "description", "question", "next_location")
    assert_equal "name", room.name
  end
end
