Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :users, only: %i(create update destroy show)
    resources :wallpapers, only: %i(create update destroy index show) do
      resource :like, only: %i(create destroy)
      resources :comments, only: %i(create index)
    end
    resources :comments, only: %i(destroy)
    resources :sessions, only: %i(create)

    post "/sign_in", to: "sessions#create"
  end
end
