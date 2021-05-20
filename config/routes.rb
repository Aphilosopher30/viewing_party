Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: "application#welcome"

  get "/register", to: "users#new"
  get "/login", to: "sessions#new"
  get '/discover', to: 'movies#discover'

  resources :users, except: [:new]
  resources :sessions, except: [:new]
  resources :movies
  resources :dashboards, only: [:index]
  resources :friends
  resources :parties
end
