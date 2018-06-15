Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :news, only: [:index, :show]

  get '/conferences/future',  to: 'conferences#future'
  get '/conferences/ended',   to: 'conferences#ended'
  get '/conference/:id',      to: 'conferences#show', as: 'show_conference'

  get '/monograph/future',    to: 'monographs#future'
  get '/monograph/ended',     to: 'monographs#ended'

  post '/member_registration', to: 'conferences#registration', as: 'conference_registration'
  post '/add_monograph_editor', to: 'monographs#registration', as: 'monograph_registration'

  resources :contacts, only: [:index, :create]

  root 'main#index'
end
