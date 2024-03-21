Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/", to: "home#index"

  # resources :developers do
  #   resources :games, shallow: true
  # end
  # resources :games

  get "/developers", to: "developers#index"
  get "/developers/new", to: "developers#new"
  get "/developers/:id", to: "developers#show"
  post "/developers", to: "developers#create"
  # get "/developers/:developer_id/games", to: "games#index"
  get "/developers/:developer_id/games", to: "developer_games#index"

  get "/games", to: "games#index"
  get "/games/new", to: "games#new"
  get "/games/:game_id", to: "games#show"
  post "/games", to: "games#create"
end
