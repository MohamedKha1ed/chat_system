class AddChatAndMessageCount < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :chats_count, :integer, default: 0
    add_column :chats, :messages_count, :integer, default: 0
  end
end
