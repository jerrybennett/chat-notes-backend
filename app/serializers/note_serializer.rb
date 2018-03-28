class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :user, :chat_room, :created_at
end
