Rails.application.routes.draw do
  apipie
  post 'user_token' => 'user_token#create'
  namespace :api do
    namespace :v1 do
      jsonapi_resources :users, except: [:index]
      jsonapi_resources :posts
    end
  end
end
