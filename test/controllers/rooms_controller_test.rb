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

  test "should check authenticate user before_action" do
    get new_room_path

    follow_redirect!

    assert_template 'sessions/new'
  end
end
