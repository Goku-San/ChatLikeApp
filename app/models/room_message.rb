class RoomMessage < ApplicationRecord
  include UsersHelper

  belongs_to :room, inverse_of: :room_messages
  belongs_to :user

  def as_json options
    super(options).merge user_avatar_url: gravatar_for(current_user, size: 32)
  end

  private

  def current_user
    user
  end
end
