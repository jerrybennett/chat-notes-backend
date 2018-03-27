class ChatRoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :users, :messages, :notes 
end
