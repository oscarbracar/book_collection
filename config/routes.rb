Rails.application.routes.draw do
  resoures :books
  root "books#index"
end
