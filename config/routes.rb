require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  resources :messages
  resources :chats do
    collection do
      post :create_message
    end
  end
  resources :applications do
    collection do
      post :create_chat
    end
  end
end
