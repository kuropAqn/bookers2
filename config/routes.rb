Rails.application.routes.draw do

  get 'book/index'
  get 'book/show'
  get 'book/create'
  get 'book/edit'
  get 'user/index'
  get 'user/show'
  get 'user/edit'
  get 'user/update'
  get 'homes/top'
  get 'homes/about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
end
