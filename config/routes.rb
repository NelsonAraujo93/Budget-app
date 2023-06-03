Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root('splash#index')
  resources :users, only: [:index]
  resources :categories, only: %i[new create destroy show] do
    resources :proceedings, only: %i[new create destroy]
  end
end
