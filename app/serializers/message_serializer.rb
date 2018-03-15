class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :chat_room_id, :user_id
end
