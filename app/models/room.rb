class Room < ApplicationRecord
  has_many :room_messages, inverse_of: :room, dependent: :destroy
end
