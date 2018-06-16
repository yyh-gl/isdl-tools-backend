Rails.application.routes.draw do

  mount GrapeSwaggerRails::Engine => "/"

  namespace :api do
    get '/users', to: 'users#index'
    post '/users', to: 'users#create'
    get '/users/:id', to: 'users#show'

    get '/musics', to: 'musics#index'
    post '/musics', to: 'musics#create'
    get '/musics/:id', to: 'musics#show'
    get '/musics/uploaded/user/:id', to: 'musics#get_uploaded'
    get '/musics/possessed/user/:id', to: 'musics#get_possessed'
    get '/musics/cross/accepted/user/:id', to: 'musics#get_cross_accepted_music'
    post '/musics/cross/user', to: 'musics#save_received_cross_music'

    get '/lives', to: 'lives#index'
    post '/lives', to: 'lives#create'
    get '/lives/:id', to: 'lives#show'

    get '/calendars', to: 'calendars#index'
    get '/calendars/:event_title', to: 'calendars#search'

    namespace :location do
      get '/restaurants', to: 'restaurants#search'
      get '/venues', to: 'venues#search'
    end

    namespace :analysis do
      post '/visions/face', to: 'visions#analyze_face'
      post '/visions/label', to: 'visions#analyze_label'
      post '/emotions', to: 'emotions#analyze'
      post '/conversations', to: 'conversations#understand'
    end
  end

end