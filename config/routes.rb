Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :users, only: %i(create update destroy show)
    resources :wallpapers, only: %i(create update destroy index show) do
      resource :like, only: %i(create destroy)
    end
    resources :sessions, only: %i(create)

    post "/sign_in", to: "sessions#create"
  end
end
