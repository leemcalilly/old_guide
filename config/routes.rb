Guide::Application.routes.draw do
  
  get '/about' => 'pages#about'
  
  root :to => 'pages#home'
  
end
