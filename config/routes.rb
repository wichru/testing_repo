# frozen_string_literal: true

Rails.application.routes.draw do
  get 'comments/new'
  root 'welcome#index'

  resources :posts

  resources :comments
  # root 'welcome#index'
  # get 'posts', to: 'posts#index'
  # get 'posts/new', to: 'posts#new', as: 'new_post'
  # post 'posts', to: 'posts#create'
end
