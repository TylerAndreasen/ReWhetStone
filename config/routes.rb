Rails.application.routes.draw do
  devise_for :players, controllers: {
    registrations: 'players/registrations',
    sessions: 'players/sessions',
    passwords: 'players/passwords'
   }
   
  resources :players do
    resources :rounds, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "players#index"
end