Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  resources :terms
  resources :courses
  
  resources :books do 
    resources :listings
  end
  resources :sellers, only: [:index]
  resources :buyers, only: [:index]
  
  get "book_callbacks/:isbn", to: "book_callbacks#from_google", as: "book_from_google"

  resources :chatrooms
end
