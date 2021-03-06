Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: { registrations: "users/registrations", 
                                    omniauth_callbacks: "users/omniauth_callbacks" }
  
  resources :terms
  resources :courses
  
  resources :books do 
    resources :listings, shallow: true do
      resources :conversations, only: :create
    end
  end

  resources :listing_status, only: [:update]

  resources :conversations do 
    resources :messages, only: :create
  end

  resources :sellers, only: [:index]
  resources :listing_history, only: [:index] 
  resources :buyers, only: [:index]
  resources :notifications do 
    collection do 
      post :mark_as_read
    end
  end
  
  get "book_callbacks/:isbn", to: "book_callbacks#from_google", as: "book_from_google"

  scope controller: :help do 
    get :conditions
    get :privacy 
    get :faq 
    get :contact
  end

  scope controller: :user_settings do 
    patch :toggle_email_subscription
  end

  resources :image_attachments, only: [:destroy]
end