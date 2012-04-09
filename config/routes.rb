ParseRailsBoilerplate::Application.routes.draw do
  get "home/index"

  get "log_in" => "sessions#new", :as => "log_in"  
  get "log_out" => "sessions#destroy", :as => "log_out"  
  
  get "sign_up" => "users#new", :as => "sign_up"  
  root :to => "home#index"  
  resources :users  
  resources :sessions 
  resources :authentications
  match '/auth/:provider/callback' => 'authentications#create'  
end