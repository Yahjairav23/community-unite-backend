Rails.application.routes.draw do
  resources :action_takens
  resources :escalations
  resources :reports
  resources :comments
  resources :police_departments
  resources :police
  
  get '/escalated_reports', to: 'reports#escalations'



  namespace :api do
    namespace :v1 do
      resources :citizens
      resources :police
      resources :oversight_agencies
      post '/search', to: 'citizens#search'
      post '/login', to: 'auth#create'
      get '/citizen_decode_token', to: 'citizens#profile' #given a token, find the authenticated user
      get '/police_decode_token', to: 'police#profile' #given a token, find the authenticated user
      get '/oversightAgency_decode_token', to: 'oversight_agencies#profile'
    end
  end

end
