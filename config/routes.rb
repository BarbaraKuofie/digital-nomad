Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :users

  resources :properties

  resources :cities

  resources :countries

  resources :reviews

  resources :stays
  
=======

  root "welcome#home"
>>>>>>> ae9f9448aae69f7b25aca8a343cdb4d01e4995bc
end
