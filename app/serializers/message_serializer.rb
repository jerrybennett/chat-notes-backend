class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :chat_room, :user
end
