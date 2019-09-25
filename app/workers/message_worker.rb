class MessageWorker
  include Sidekiq::Worker

  def perform(chat_id, content, number)
    Message.create!(chat_id: chat_id, content: content, number: number)
  end
end