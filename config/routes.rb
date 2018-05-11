Rails.application.routes.draw do
  apipie
  post 'user_token' => 'user_token#create'
  namespace :api do
    namespace :v1 do
      namespace :backend do
        jsonapi_resources :users, except: [:index]
        jsonapi_resources :posts
        jsonapi_resources :comments, only: [:create]
        jsonapi_resources :tags, except: [:show]
        jsonapi_resources :mailing_lists, only: [:index, :destroy]
        jsonapi_resources :messages, only: [:index, :show, :destroy]
      end
      namespace :frontend do 
        jsonapi_resources :posts, only: [:index, :show]
        jsonapi_resources :comments, only: [:create]
        jsonapi_resources :tags, only: [:index]
        jsonapi_resources :mailing_lists, only: [:create]
      end
    end
  end
end
