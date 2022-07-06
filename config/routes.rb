Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :posts

  root 'posts#index'

  get '/users/:username/posts', to: 'users#show', as: 'user_posts'

  patch 'posts/:id/update_rating', to: 'posts#update_rating', as: 'update_rating'
end
