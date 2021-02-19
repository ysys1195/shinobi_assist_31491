Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms, only: [:create, :show], param: :token do
    resources :characters, only: [:create]
    resources :conditions, only: [:create]
    resources :feelings, only: [:create]
  end
end
