Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
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
end
