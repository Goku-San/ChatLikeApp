class RoomMessage < ApplicationRecord
  include UsersHelper
  include RoomMessagesHelper

  belongs_to :room, inverse_of: :room_messages
  belongs_to :user

  validates :message, presence: true

  def as_json options
    super(options).merge \
      user_avatar_url: gravatar_for(current_user, size: 32),
      time_format:     message_time_format(self)
  end

  private

  def current_user
    user
  end
end
