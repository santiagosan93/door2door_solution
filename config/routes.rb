Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


get '/vehicles', to: 'api/v1/vehicles#index', defaults: { format: :json }
get '/vehicles/:id', to: 'api/v1/vehicles#show', defaults: { format: :json }
post '/vehicles', to: 'api/v1/vehicles#create', defaults: { format: :json }
post '/vehicles/:id/locations', to: 'api/v1/locations#create', defaults: { format: :json }
delete '/vehicles/:id', to: 'api/v1/vehicles#destroy', defaults: { format: :json }

  # namespace :api, defaults: { format: :json } do
  #   resources :vehicles, only: [:create, :destroy ] do
  #     resources :locations, only: [:create ]
  #   end
  # end
end
