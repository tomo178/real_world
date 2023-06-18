Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :articles, param: :slug, only: [:create, :show, :update, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
