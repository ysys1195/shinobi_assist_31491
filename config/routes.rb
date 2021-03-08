Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms, only: [:create, :show, :destroy], param: :token do
    resources :characters, only: [:create, :update]
    resources :secrets, only: [:create, :update]
    resources :open_secrets, only: [:update]
    get 'open_secrets/:id', to: 'open_secrets#unveiled'
    resources :last_resorts, only: [:create]
    resources :open_last_resorts, only: [:create]
    resources :conditions, only: [:create, :destroy]
    resources :feelings, only: [:create, :destroy]
  end
end
