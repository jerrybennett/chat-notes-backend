Rails.application.routes.draw do
  resources :chat_room_users
  namespace :api do
    namespace :v1 do
      resources :notes
      resources :messages
      resources :chat_rooms
      resources :users
      resources :chat_room_users
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
