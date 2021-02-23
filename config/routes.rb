Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms, only: [:create, :show], param: :token do
    resources :characters, only: [:create, :update]
    resources :conditions, only: [:create]
    resources :feelings, only: [:new, :create]
  end
end
