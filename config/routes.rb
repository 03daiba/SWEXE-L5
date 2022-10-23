Rails.application.routes.draw do
  
  get 'top/main'
  resources :users
  resources :tweets
  root 'top#main'
  
  get 'top/main'
  post 'top/login'
  
  get 'top/logout'
  
  resources :likes
  get 'like/:id', to: 'likes#show'
  post 'likes', to: 'likes#create'
  delete 'likes/:id', to: 'likes#destroy'
  
end
