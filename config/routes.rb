Rails.application.routes.draw do
  get 'user/show'
  get 'events/index'
  get 'events/new'
  get 'events/create'
  get 'events/delete'

  root "events#index"

  devise_for :users
  resources :users, only: [:show]
  resources :events, only: [:index, :show, :new, :create, :delete]
  resources :attendances
  post '/attendances/:attendee_id', to: "attendances#create", as: "create_attending_event"

end
