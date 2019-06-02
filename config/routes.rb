Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  resources :terms
  resources :courses
  
  resources :books do 
    resources :listings
  end

  resources :sellers, only: [:index]
end
