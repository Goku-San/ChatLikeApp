require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @goku = users :goku
  end

  test "should GET root_path" do
    # Get root path as unauthenticated user
    get root_path

    assert_template 'sessions/new'

    # Get root path as authenticated user
    sign_in @goku

    get root_path

    assert_template 'rooms/index'
  end

  # This test ensures that -- before_action authenticate_user! -- works properly
  test "should check authenticate user before_action" do
    get new_room_path

    assert_response :redirect

    follow_redirect!

    assert_template 'sessions/new'
  end

  test "room create action" do
    sign_in @goku

    # invalid submission
    assert_no_difference 'Room.count' do
      post rooms_path, params: { room: { name: "" } }
    end

    assert_response :success

    assert_template 'rooms/new'

    assert_select 'div.alert-danger'

    # valid submission
    assert_difference 'Room.count', 1 do
      post rooms_path, params: { room: { name: "Test room" } }
    end

    assert_response :redirect

    follow_redirect!

    assert_template "rooms/index"

    assert_select 'a[href=?]', new_room_path, count: 1
    assert_select 'div.alert-primary'
  end
end
