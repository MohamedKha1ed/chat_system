class Chat < ApplicationRecord
  has_many :messages

  def self.create_chat(app_token, name)
    Chat.create(application_id: Application.find_by(token: app_token).try(:id), name: name)
  end
end