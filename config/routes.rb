Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms, only: [:create, :show, :destroy], param: :token do
    resources :characters, only: [:create, :update]
    resources :conditions, only: [:create, :destroy]
    resources :feelings, only: [:create, :destroy]
  end
end
