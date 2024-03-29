Rails.application.routes.draw do
  get 'profiles/index'

  resources :likes, only: %i[create destroy]
  resources :comments
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  post 'users/:id/follow', to: 'users#follow', as: 'follow'
  post 'users/:id/unfollow', to: 'users#unfollow', as: 'unfollow'
  post 'users/:id/accept', to: 'users#accept', as: 'accept'
  post 'users/:id/decline', to: 'users#decline', as: 'decline'
  post 'users/:id/cancel', to: 'users#cancel', as: 'cancel'

  resources :users, only: [:show]

  get 'home/about'
  get 'posts/myposts'
  resources :posts

  root 'posts#index'
end
