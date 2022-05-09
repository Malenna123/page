Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :posts,only: %i[index show ]
  # admin section
  namespace :admin do
    root 'home#index'
    resources :posts
  end

end
