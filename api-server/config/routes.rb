Rails.application.routes.draw do
  namespace :api do
    get '/users', to: 'users#index'
    get '/users/:id', to: 'users#show'

    namespace :google do
      post '/languages', to: 'languages#analyze'
    end
  end
end
