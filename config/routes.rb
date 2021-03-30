Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'rooms#index'
  resources :users, only: [:show, :edit, :update]
  resources :roles, only: [:create]
  resources :rooms, only: [:create, :show, :destroy], param: :token do
    resources :characters, only: [:create, :update]
    resources :secrets, only: [:create, :update]
    resources :open_secrets, only: [:update]
    get 'open_secrets/:id', to: 'open_secrets#unveiled'
    resources :last_resorts, only: [:create, :update]
    resources :open_last_resorts, only: [:update]
    get 'open_last_resorts/:id', to: 'open_last_resorts#unveiled'
    resources :conditions, only: [:create, :destroy]
    resources :feelings, only: [:create, :destroy]
  end
  get 'rooms/session_logs/:room_token/new', to: 'session_logs#new'
  resources :session_logs, only: [:create, :edit, :update, :destroy]
end
