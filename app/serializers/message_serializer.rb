class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :chat_rm_id, :user_id
end
