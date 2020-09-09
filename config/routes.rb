Rails.application.routes.draw do

  resources :genres, only: [:index, :edit, :new, :update, :create, :destroy]

  root 'homes#top'
  get 'homes/about'

  resources :items
  get 'items/search'

  get 'users/mypage'
  get 'users/myitem'
  devise_for :users
  resources :users, only: [:edit, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
