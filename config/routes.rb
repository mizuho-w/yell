Rails.application.routes.draw do

  get 'reservations/reserve_user/:id' => 'reservations#reserve_user', as:'reserve_user'
  get 'reservations/myitem/:id' => 'reservations#myitem', as:'reserve_myitem'
  resources :reservations, only:[:destroy, :update]
  post 'reservations/:id' => 'reservations#create'
  resources :genres, only: [:index, :edit, :new, :update, :create, :destroy]

  root 'homes#top'
  get 'homes/about'

  resources :items
  get 'items/search'

  get 'users/mypage/:id' => 'users#mypage', as:'mypage'
  get 'users/myitem/:id' => 'users#myitem', as:'myitem'
  devise_for :users
  resources :users, only: [:edit, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
