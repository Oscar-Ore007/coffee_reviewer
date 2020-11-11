Rails.application.routes.draw do
  root 'sessions#index'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/auth/:provider/callback' => 'sessions#oauth_login'

  get '/hazelnuts' => 'coffees#hazelnut'

  get '/vanilla' => 'coffees#vanilla'

  get '/banana' => 'coffees#vanilla'

  resources :reviews
  resources :coffees do 
    resources :reviews, only: [:new, :index]
  end 


  resources :brands
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
