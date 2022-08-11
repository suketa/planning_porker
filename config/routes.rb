Rails.application.routes.draw do
  resources :players
  resources :games, param: :token, only: %i[show create]
  resources :estimates, only: [:create]
  resources :point_statuses, only: [:create]

  root 'games#new'
end
