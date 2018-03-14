class ChatRoomUserSerializer < ActiveModel::Serializer
  attributes :id, :chat_rm_id, :user_id
end
