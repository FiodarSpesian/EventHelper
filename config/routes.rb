Rails.application.routes.draw do
  root to: 'sessions#new'
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update destroy index] do
    resources :events
  end
  resources :categories
end
