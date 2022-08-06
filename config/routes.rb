Rails.application.routes.draw do
  resources :players
  resources :games, param: :token

  root 'games#new'
end
