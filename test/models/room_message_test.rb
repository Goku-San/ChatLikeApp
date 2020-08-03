require 'test_helper'

class RoomMessageTest < ActiveSupport::TestCase
  def setup
    @message = room_messages :message_one
  end

  test "message is valid" do
    assert @message.valid?, @message.errors.full_messages
  end

  test "message should be present" do
    @message.message = ""

    assert_not @message.valid?
  end
end
