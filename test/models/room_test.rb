require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  def setup
    @room = rooms :lobby
  end

  test "room is valid" do
    assert @room.valid?, @room.errors.full_messages
  end

  test "room name should be present" do
    @room.name = ""

    assert_not @room.valid?
  end

  test "room name should be unique" do
    duplicate_room      = @room.dup
    duplicate_room.name = @room.name.upcase

    @room.save!

    assert_not duplicate_room.valid?
  end
end
