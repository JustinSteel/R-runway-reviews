Rails.application.routes.draw do
  resources :airports

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :reviews
      end
      get '/reviews', to: 'reviews#index'
      post '/reviews', to: 'reviews#create'
    end
  end
  get '/airports', to: 'airports#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  

  # Defines the root path route ("/")
  # root "posts#index"
end
