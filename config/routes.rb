require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'
  root to: "products#index"

  resources :products
  resources :amazon_urls

  namespace :api do
    resources :products, except: [:new, :edit]
    resources :amazon_urls, except: [:new, :edit]
  end
end
