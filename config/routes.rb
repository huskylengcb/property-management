# == Route Map
#

Rails.application.routes.draw do
  get 'welcome/index'

  resources :homes
  resources :towers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "mains#show"

  resource :main, only: :show
  resources :communities, :homes, :towers

  namespace :api do
    namespace :v1 do
      resources :vocabularies, only: [:index]
      resources :vocabulary_dictation_logs, only: [:create, :index]
      resources :communities, only: [:index]
      resource :minps do
        collection do
          post 'login'
        end
      end
      resources :users do
        collection do
          get 'current'
        end
      end
      resources :adverts
      resources :categories
    end
  end

  get '/admin/login' => 'admin/sessions#new'
  delete '/admin/logout' => 'admin/sessions#destroy'

  namespace :admin do
    resources :vocabulary_dictation_logs
    resources :vocabularies
    resource :main, only: [:show]
    resource :session, only: [:new, :create, :destroy]
    resources :admin_users
    resources :users
    resources :categories do
      member do
        post :move
      end
    end

    resources :adverts do
      member do
        post :move
        patch :switch
      end
    end
  end

  #支持功能，如上传等
  scope module: :support do
    resources :uploads, path: 'upload', only: [:create, :destroy] do
      collection do
        post :wangedit
      end
    end
  end
end
