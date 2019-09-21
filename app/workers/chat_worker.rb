class ChatWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(app_token, name)
    Chat.create_chat(app_token, name)
  end
end