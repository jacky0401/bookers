Rails.application.routes.draw do
  get 'book/index'
  root 'book#index'
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
