Rails.application.routes.draw do
  resources :reports
  resources :comments
  resources :citizens
  resources :police_departments
  resources :police
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
