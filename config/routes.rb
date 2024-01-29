Rails.application.routes.draw do
  get 'games/addition'
  get 'games/subtraction'
  get 'games/division'
  get 'games/multiplication'
  get 'home/index'
  post 'check', to: 'games#check'
  post 'reset_count', to: 'games#reset'

  # Define your application routes per the DSL in https://guides.r
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'home#index'
  get 'up' => 'rails/health#show', as: :rails_health_check
  get 'hello', to: 'hello#index'

  # Defines the root path route ("/")
  # root "posts#index"
end
