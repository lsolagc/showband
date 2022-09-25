Rails.application.routes.draw do
  devise_for :users
  resources :requests, only: [:index, :new, :create, :destroy]
  resources :shows, only: [:index, :show]
  resources :musics, only: [:index]
  root to: "welcome#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
