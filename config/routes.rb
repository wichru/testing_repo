Rails.application.routes.draw do
  root 'welcome#index'

  resources :posts

  # root 'welcome#index'
  # get 'posts', to: 'posts#index'
  # get 'posts/new', to: 'posts#new', as: 'new_post'
  # post 'posts', to: 'posts#create'
end
