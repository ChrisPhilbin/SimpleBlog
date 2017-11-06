Rails.application.routes.draw do
  
  get 'welcome/index'

  root 'articles#index'
  
  resources :articles, param: :slug
  resources :users
  
  get    '/submit', to: 'articles#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get    '/rants',  to: 'articles#rants'
  get    '/tech',   to: 'articles#tech'
  
  
end