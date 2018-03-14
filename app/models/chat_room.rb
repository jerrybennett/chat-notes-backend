class ChatRoom < ApplicationRecord
  has_many :messages
  has_many :users, through: :chat_room_users
end
