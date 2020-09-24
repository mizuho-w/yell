Rails.application.routes.draw do


  devise_for :users

  get 'relationships/follower/:follow_id' => 'relationships#follower', as: 'follower'
  get 'relationships/following/:follow_id' => 'relationships#following', as: 'following'

  get 'reservations/reserve_user/:id' => 'reservations#reserve_user', as:'reserve_user'
  get 'reservations/myitem/:id' => 'reservations#myitem', as:'reserve_myitem'
  resources :reservations, only:[:destroy, :update]
  post 'reservations/:id' => 'reservations#create'
  resources :genres, only: [:index, :edit, :new, :update, :create, :destroy]

  root 'homes#top'
  get 'homes/about'

  get 'items/search' => 'items#search', as: 'search'

  resources :items do
    resource :favorites, only: [:create, :destroy]
  end

  get 'users/mypage/:id' => 'users#mypage', as:'mypage'
  get 'users/myitem/:id' => 'users#myitem', as:'myitem'

  resources :relationships, only: [:create, :destroy]

  resources :users, only: [:edit, :update, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
