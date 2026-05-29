Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :patients, except: [:destroy] do
    resources :appointments, only: [:index]
  end

  resources :providers do
    resources :appointments, only: [:index]
  end

  resources :appointments 
  
  # get '/patients', to: 'patients#index'
  # post '/patients', to: 'patients#create'
  # get '/patients/:id', to: 'patients#show'
  # patch '/patients/:id', to: 'patients#update'
  # delete '/patients/:id', to: 'patients#destroy'
  # get '/patients/:id/appointments', to: 'appointments#index'

  # get '/providers', to: 'providers#index'
  # post '/providers', to: 'providers#create'
  # get '/providers/:id', to: 'providers#show'
  # patch '/providers/:id', to: 'providers#update'
  # delete '/providers/:id', to: 'providers#destroy'
  # get '/providers/:id/appointments', to: 'appointments#index'

  # get '/appointments', to: 'appointments#index'
  # post '/appointments', to: 'appointments#create'
  # get '/appointments/:id', to: 'appointments#show'
  # patch '/appointments/:id', to: 'appointments#update'
  # delete '/appointments/:id', to: 'appointments#destroy'


end
