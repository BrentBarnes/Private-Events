Rails.application.routes.draw do
  get 'invitations/new'
  get 'invitations/create'
  get 'user/show'
  get 'events/index'
  get 'events/new'
  get 'events/create'
  get 'events/delete'

  root "events#index"

  devise_for :users
  resources :users, only: [:show]
  resources :events
  resources :attendances
  resources :invitations
end
