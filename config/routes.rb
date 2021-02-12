Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms, only: [:new, :create, :show], param: :token do
    resources :characters, only: [:new, :create]
    resources :conditions, only: [:new, :create]
    resources :feelings, only: [:new, :create]
  end
end
