require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new \
      username:              "Petar",
      email:                 "ralchev@test.com",
      password:              "password",
      password_confirmation: "password"
  end

  test "user is valid" do
    assert @user.valid?, @user.errors.full_messages
  end

  test "username should be present" do
    @user.username = ""

    assert_not @user.valid?
  end

  test "username should be unique" do
    duplicate_user          = @user.dup
    duplicate_user.username = @user.username.upcase
    duplicate_user.email    = "ralchev1@test.com"

    @user.save!

    assert_not duplicate_user.valid?
  end

  test "email should be present" do
    @user.email = ""

    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6

    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5

    assert_not @user.valid?
  end
end
