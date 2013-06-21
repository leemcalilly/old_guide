Guide::Application.routes.draw do
  
  resources :lessons

  get '/about' => 'public#about'
  get '/how-it-works' => 'public#how_it_works', :as => 'how_it_works'
  
  root :to => 'public#home'
  
end