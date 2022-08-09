Rails.application.routes.draw do
  resources :players
  resources :games, param: :token
  resources :estimates, only: [:create]
  resources :point_statuses, only: [:create]

  root 'games#new'
end
