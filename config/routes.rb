Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'sms', to: 'users/registrations#sms'
    get 'adress', to: 'users/registrations#adress'
    post 'create', to: 'users/registrations#create'
    post 'address_create', to: 'users/registrations#address_create'
  end
  

  root to: 'homes#index'

  resources :homes, only: [:index, :show, :edit, :update] do
    member do
      get "profile"
      get "credit"
      get "logout" 
    end
  end

  resources :accounts, only: [:index, :edit, :update] do
    member do
      get "listing"
      get "listing_progress"
      get "completed"
    end
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
  
  resources :products, only: [:show, :destroy, :edit, :update, :new, :create] do
    member do
      get 'buy'
      post 'pay'
      get 'done'
    end
  end
end



# colectionとmember調べること