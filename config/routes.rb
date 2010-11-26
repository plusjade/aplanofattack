Aplanofattack::Application.routes.draw do

  resource :user_session
  resource :account, :controller => "users"
  resources :users
  
  resources :pages do
    resources :sliders #, :name_prefix => "page_"
  end
    
  resources :sliders
  
  root :to => "home#index"
  match "about" => "home#about"
  match "privacy" => "home#privacy"
  match "terms-of-service" => "home#tos"
  match "about" => "home#about"
  match "admin" => "admin#index"
  
  match ":controller/:action/:id"
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'

end
