Rails.application.routes.draw do
  resources :wallets, only: [:new]
  resources :workspaces, only: [:new, :create, :show]
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
