json.extract! chat, :id, :number, :name, :created_at, :updated_at
json.url chat_url(chat, format: :json)
