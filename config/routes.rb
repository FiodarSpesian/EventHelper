Rails.application.routes.draw do
  root to: "events#index"

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update destroy]
  resources :events
end
