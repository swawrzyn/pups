Rails.application.routes.draw do
  post 'login', to: 'login#login'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :pups, only: [ :index, :show, :update, :create, :destroy ] do
        resources :bookings, only: [ :new, :create ]
      end
      resources :bookings, only: [:show, :update]
      resources :users, only: [ :show ]
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :reviews, only: [ :index, :create ]
    end
  end
end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
