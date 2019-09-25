class Application < ApplicationRecord
  has_many :chats
  has_secure_token :token

  def create_chat(chat_name)
    self.with_lock do
      chat_number = self.chats_count + 1
      ChatWorker.perform_async(self.id, chat_name, chat_number)
      self.update(chats_count: chat_number)
      return {chat: {chat_number: chat_number}, status: "created"}
    end
  end
end
