Rails.application.routes.draw do

  mount GrapeSwaggerRails::Engine => "/"

  namespace :api do
    get '/users', to: 'users#index'
    post '/users', to: 'users#create'
    get '/users/:id', to: 'users#show'

    get '/calendars', to: 'calendars#index'
    get '/calendars/:event_title', to: 'calendars#search'

    namespace :location do
      get '/restaurants', to: 'restaurants#search'
      get '/venues', to: 'venues#search'
    end

    namespace :analysis do
      post '/emotions', to: 'emotions#analyze'
      post '/conversations', to: 'conversations#understand'
    end
  end

end