Rails.application.routes.draw do
  get 'home', to: 'app_home#home', as: 'home'

  devise_for :users, controllers: {
    sessions: 'users/sessions'  # allow customizing controller behavior
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
