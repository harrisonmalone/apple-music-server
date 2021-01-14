Rails.application.routes.draw do
  resources :albums, only: [:index]
  post "/albums/create", to: "albums#create"
  delete "/albums/destroy", to: "albums#destroy"
  put "/albums/update", to: "albums#update"
  post "/albums/seed", to: "albums#seed"
end
