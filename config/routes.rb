Rails.application.routes.draw do
  
   #devise_for :users
   devise_for :users 
   root "welcome#home"
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
 
  resources :properties

  resources :cities

  resources :countries

  resources :reviews

  resources :stays
 

end
