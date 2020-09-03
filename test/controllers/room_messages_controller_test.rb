require 'test_helper'

class RoomMessagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @goku = users :goku
    @room = rooms :lobby
  end

  test "should handle invalid message" do
    sign_in @goku

    assert_no_difference 'RoomMessage.count' do
      post room_messages_path,
           params: { room_message: { message: "", room_id: @room.id } },
           xhr:    true
    end

    assert_response :unprocessable_entity

    assert_equal "can't be blank", response.parsed_body["errors"]["message"].join
  end

  test "should create valid message" do
    sign_in @goku

    assert_difference 'RoomMessage.count', 1 do
      post room_messages_path,
           params: { room_message: { message: "Test message", room_id: @room.id } },
           xhr:    true
    end

    assert_response :success
  end
end
