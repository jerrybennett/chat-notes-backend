class CreateChatRoomUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_room_users do |t|
      t.integer :chat_rm_id
      t.integer :user_id

      t.timestamps
    end
  end
end