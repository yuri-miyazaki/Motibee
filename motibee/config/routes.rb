Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :users, only: [:show]
  resources :tweets do 
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end


  get 'tops/link' => 'tops#link'
  root 'tops#index'
  
end
