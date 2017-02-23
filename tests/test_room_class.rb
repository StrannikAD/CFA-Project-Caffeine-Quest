require "test/unit"
require_relative "../room_class"

class RoomTest < Test::Unit::TestCase

  def test_room_class_initializes_correctly
    room = Room.new("name", "description", "question", "next_location")
    assert_equal "name", room.name
  end

  def test_description_returns_a_string
    room = Room.new("name", "description", "question", "next_location")
    assert_equal String, room.description.class
  end
end
