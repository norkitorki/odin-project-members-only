Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :posts

  root 'posts#index'

  patch 'posts/:id/update_rating', to: 'posts#update_rating', as: 'update_rating'
end
