class Message < ApplicationRecord
  searchkick
  belongs_to :chat

  validates :chat_id, presence: true
  validates :number, presence: true

  def self.search_in_chat(chat_id, search_text)
    Message.search(search_text, misspellings: {edit_distance: 3}, where: {chat_id: chat_id}, select: [:chat_id,
                                                                                                      :content,
                                                                                                      :message_number])
  end
end