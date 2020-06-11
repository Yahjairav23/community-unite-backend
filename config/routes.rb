Rails.application.routes.draw do
  resources :reports
  resources :comments
  resources :police_departments
  resources :police

  namespace :api do
    namespace :v1 do
      resources :citizens
      resources :police
      post '/search', to: 'citizens#search'
      post '/login', to: 'auth#create'
      get '/citizen_decode_token', to: 'citizens#profile' #given a token, find the authenticated user
      get '/police_decode_token', to: 'police#profile' #given a token, find the authenticated user
    end
  end

end
