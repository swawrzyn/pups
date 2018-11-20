Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
  namespace :v1 do
    resources :pups
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :pups
    end
  end
end
