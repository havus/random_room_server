Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'

  namespace :api, format: :json do
    namespace :v1 do
      resources :messages
      resources :rooms
    end
  end
end
