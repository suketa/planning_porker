# frozen_string_literal: true

Rails.application.routes.draw do
  resources :players, only: %i[show new create]
  resources :games, param: :token, only: %i[show create]
  resources :estimates, only: [:create]
  resources :point_statuses, only: [:create]

  root 'games#new'
end
