Guide::Application.routes.draw do
  
  resources :photos

  resources :users
  resources :sessions
  resources :password_resets
  resources :lessons
  
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  get "logout" => "sessions#destroy", :as => "logout"
  get "password_resets/create"
  get "password_resets/edit"
  get "password_resets/update"
  
  get '/about' => 'public#about'
  get '/how-it-works' => 'public#how_it_works', :as => 'how_it_works'
  
  root :to => 'public#home'  
  
end