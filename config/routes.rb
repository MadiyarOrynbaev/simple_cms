Rails.application.routes.draw do


  root  'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  
  resources :users
  resources :subjects
  resources :pages
  resources :sections
  
  get 'login', to: "users#login"
  get 'admin', to: "users#admin"
  match 'attempt_login', to: "users#attempt_login", via: "post"
  match 'logout', to: "users#logout", via: 'get'
  
  get 'show/:link', to: "static_pages#show"

end