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
      resources :communities, only: [:index]
      resource :minps do
        collection do
          post 'login'
        end
      end
      resources :users
    end
  end

  get '/admin/login' => 'admin/sessions#new'
  delete '/admin/logout' => 'admin/sessions#destroy'

  namespace :admin do
    resource :main, only: [:show]
    resource :session, only: [:new, :create, :destroy]
    resources :admin_users
    resources :users
    resources :categories do
      member do
        post :move
      end
    end

    resources :adverts
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
