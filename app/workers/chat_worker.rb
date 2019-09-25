class ChatWorker
  include Sidekiq::Worker

  def perform(application_id, name, number)
    Chat.create!(application_id: application_id, name: name, number: number)
  end
end