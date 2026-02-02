Rails.application.routes.draw do
  resources :books do
    member do
      get :confirm_destroy
    end
  end
  root "books#index"
end
