class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :room_messages, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
