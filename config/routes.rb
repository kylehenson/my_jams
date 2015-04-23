Rails.application.routes.draw do
  resources :songs
  resources :users, only: [:new, :create, :show]

  root 'songs#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :tags
  end

end
