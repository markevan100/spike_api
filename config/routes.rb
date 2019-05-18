Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events
      resources :sessions, only: [:create, :destroy]
      resources :user_events, only: [:create, :destroy]
      devise_for :users, controllers: { registrations: "users/registrations" }
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
