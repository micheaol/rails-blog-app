# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'

  post 'users/:id/comment/create', to: 'comments#create', as: 'comment_form'
  get 'users/:user_id/posts/new', to: 'posts#new', as: 'user_new_post'
  post 'users/:user_id/post', to: 'posts#create', as: 'create_new_post'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] 
  end
end
