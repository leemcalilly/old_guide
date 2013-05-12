Guide::Application.routes.draw do
  
  get '/about' => 'pages#about', :as => 'about'
  get '/how_it_works' => 'pages#how_it_works', :as => 'how_it_works'
  
  root :to => 'pages#home'
  
end