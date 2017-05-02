Rails.application.routes.draw do

  root 'static#home'

  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :attractions

  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'
  post '/sign_in', to: 'sessions#create'

  post '/ride/:id', to: 'attractions#ride', as: :ride

end
