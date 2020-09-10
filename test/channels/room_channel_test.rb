require "test_helper"

class RoomChannelTest < ActionCable::Channel::TestCase
  setup do
    @lobby = rooms :lobby
  end

  test "subscribes and streams for room" do
    subscribe room: @lobby.id

    assert subscription.confirmed?

    assert_has_stream_for @lobby
  end

  test "does not subscribe without room id" do
    subscribe

    assert subscription.rejected?, "There is active stream! Reject it!"
  end
end
