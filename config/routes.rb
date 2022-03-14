Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :transactions, only: %i[index show create]
  # Defines the root path route ("/")
  # root "articles#index"
end
