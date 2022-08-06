Rails.application.routes.draw do
  resources :games, param: :token

  root 'games#new'
end
