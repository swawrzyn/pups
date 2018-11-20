Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :pups, only: [ :index, :show, :update, :create, :destroy ]
      resources :bookings, only: [ :new, :show, :update, :create ]
    end
  end
end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
