# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  resources :posts
  resources :comments
end
