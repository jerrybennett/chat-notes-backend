class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :chat_room, :user, :created_at
end
