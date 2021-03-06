require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'

  devise_for :users
  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
        patch :uncomplete
      end
    end
  end
  root "todo_lists#index"
end
