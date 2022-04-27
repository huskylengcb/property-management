Rails.application.routes.draw do
  resources :categories
  resources :homes
  resources :towers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "mains#show"

  resource :main, only: :show
  resources :communities, :homes, :towers

  namespace :api do
    namespace :v1 do
      resources :communities, only: [:index]
    end
  end
end
