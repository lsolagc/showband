Rails.application.routes.draw do
  resources :shows
  resources :musics
  root to: "welcome#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
