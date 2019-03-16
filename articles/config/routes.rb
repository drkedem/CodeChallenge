Rails.application.routes.draw do
  root to: 'welcome#index'
  namespace :api do
      namespace :v1 do
        resources :articles, only: [:index, :show, :create, :destroy, :update]
      end
    end
  end