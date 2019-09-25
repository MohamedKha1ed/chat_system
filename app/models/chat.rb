class Chat < ApplicationRecord
  has_many :messages
  belongs_to :application

  validates :application_id, presence: true
  validates :number, presence: true

  def create_message(content)
    self.with_lock do
      message_number = self.messages_count + 1
      MessageWorker.perform_async(self.id, content, message_number)
      self.update(messages_count: message_number)
      return {chat: {message_number: message_number}, status: "created"}
    end
  end
end
