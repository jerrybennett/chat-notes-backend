class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :user_id
end
