require "test_helper"

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  setup do
    @goku = users :goku
  end

  test "connects with cookies" do
    cookies.signed[:user_id] = @goku.id

    connect

    assert_equal connection.current_user.id, @goku.id
  end

  test "reject connection without params" do
    assert_reject_connection { connect }
  end
end
