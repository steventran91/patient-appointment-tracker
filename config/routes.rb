Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  
  get '/patients', to: 'patients#index'
  post '/patients', to: 'patients#create'
  get '/patients/:id', to: 'patients#show'
  patch '/patients/:id', to: 'patients:update'
  delete '/patients/:id', to: 'patients:destroy'

end
