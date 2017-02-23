require "test/unit"
require_relative "../school_class"
require "paint"

class SchoolTest < Test::Unit::TestCase
  def test_class_initializes_correctly
    school = School.new("Player", ["rooms"])
    assert_equal "Player", school.player
  end

  def test_blink_prompt_outputs_a_coloured_string
    school = School.new("Player", ["rooms"])
    assert_equal "\e[5m>> \e[0m", school.blink_prompt
  end
end
