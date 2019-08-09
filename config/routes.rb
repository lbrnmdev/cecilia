Rails.application.routes.draw do

  patch 'disbursements/:id/process_disbursement', to: 'disbursements#process_disbursement', as: :process_disbursement
  resources :disbursements, only: [:show, :edit, :update] do
    resources :transfers, only: [:index, :new, :create]
  end

  resources :wallets, only: [:show, :edit, :update] do
    resources :disbursements, only: [:index, :new, :create]
  end

  resources :workspaces, only: [:new, :create, :show] do
    resources :wallets, only: [:index, :new, :create]
  end

  resources :user_profiles, only: [:new, :create]

  resources :memberships, only: [:new, :create]

  get 'home', to: 'app_home#home', as: 'home'

  get 'no_workspace', to: 'workspaces#no_workspace', as: 'no_workspace'

  devise_for :users, controllers: {
    # allow customizing controller behavior
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    authenticated :user do
      root 'app_home#home', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # serve websocket requests in-process
  mount ActionCable.server => '/cable'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
