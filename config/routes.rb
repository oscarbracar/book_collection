Rails.application.routes.draw do
  # OAuth routes
  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#failure"
  delete "/logout", to: "sessions#destroy"

  resources :user_books
  resources :users
  resources :books do
    member do
      get :confirm_destroy
    end
  end
  root "user_books#index"
end
