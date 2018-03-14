class User < ApplicationRecord
  has_many :notes
  has_many :messages
  has_many :chat_rooms, through: :chat_room_users
end
