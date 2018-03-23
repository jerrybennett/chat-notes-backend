Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :notes
      resources :messages
      resources :chat_rooms
      resources :users
      resources :chat_room_users
      mount ActionCable.server => '/cable'

      #### this is a custom route that will allow a fetch to 'GET' all messages for a ChatRoom with a specific ID. This will now show up in 'rake routes'

      #method: get  #URI: '/chat_rooms/:id/messages'  #to(references the controller and method): "chat_rooms#messages"

      #### this can be further cusomized for with additinal parameters and methods.
      #### Example: get '/chat_rooms/:id/messages/:id/topics', to: "chat_rooms#messages_topics"
      #### could 'get' a specific message from a specific chatroom and show all of it's topics.
      get '/chat_rooms/:id/messages', to: "chat_rooms#messages"

      get '/chat_rooms/:id/users', to: "chat_rooms#users"

      get '/users/:id/chat_rooms', to: "users#chat_rooms"
      get '/users/:id/messages', to: "users#messages"

      get '/users', to: "users#log_in"
      
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
