Guide::Application.routes.draw do
  
  resources :lessons

  get '/about' => 'pages#about'
  get '/how-it-works' => 'pages#how_it_works', :as => 'how_it_works'
  
  root :to => 'pages#home'
  
end