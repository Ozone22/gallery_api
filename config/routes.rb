Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :users
    resources :sessions, only: %i(create)

    post "/sign_in", to: "sessions#create"
  end
end
