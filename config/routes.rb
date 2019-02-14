Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    authenticated do
      root to: 'home#index'

      resources :projects do
        resources :todos
      end

      match '/fetch_developers', to: 'users#fetch_developers', via: [:get]
    end
    unauthenticated do
      root to: 'devise/sessions#new'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
