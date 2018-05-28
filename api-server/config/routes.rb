Rails.application.routes.draw do

  mount GrapeSwaggerRails::Engine => "/"

  namespace :api do
    get '/users', to: 'users#index'
    get '/users/:id', to: 'users#show'

    namespace :google do
      get '/calendars', to: 'calendars#index'
      get '/calendars/:event_title', to: 'calendars#search'
      post '/languages', to: 'languages#analyze'
    end
  end
end
