Rails.application.routes.draw do
  defaults format: :json do
    resources :transactions, only: %i[index show create]
  end

  # Defines the root path route ("/")
  root 'transactions#index'
end
