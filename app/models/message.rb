class Message < ApplicationRecord
  searchkick
  belongs_to :chat

  validates :chat_id, presence: true
  validates :number, presence: true
end
