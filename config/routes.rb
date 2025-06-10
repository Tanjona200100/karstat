Rails.application.routes.draw do
  root 'pages#home' # ou le controller de votre choix
  
  resources :users, only: [:new, :create]
  get '/signup', to: 'users#new'
  
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  
  get 'password_reset', to: 'password_resets#new', as: 'password_reset'

  get '/geojson_data', to: 'pages#geojson_data', as: 'geojson_data'

end