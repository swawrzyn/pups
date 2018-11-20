Rails.application.routes.draw do
  get 'reviews/content'
  get 'reviews/rating'
  get 'reviews/user'
  get 'reviews/booking'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :pups
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :comments, only: [ :index, :create ]
    end
  end
end
