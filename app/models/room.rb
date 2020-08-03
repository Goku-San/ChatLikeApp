class Room < ApplicationRecord
  has_many :room_messages, inverse_of: :room, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
