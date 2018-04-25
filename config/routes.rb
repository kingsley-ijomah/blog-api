Rails.application.routes.draw do
  apipie
  post 'user_token' => 'user_token#create'
  namespace :api do
    namespace :v1 do
      jsonapi_resources :users, except: [:index]
      jsonapi_resources :posts
      jsonapi_resources :comments, only: [:create]
      jsonapi_resources :tags, except: [:show]
    end
  end
end
