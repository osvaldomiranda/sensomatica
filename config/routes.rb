Sensomatica::Application.routes.draw do
  devise_for :users
  resources :readings

  resources :equipment

  root to: "home#index"
  get "home/index"

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :readings do
        collection do
          post :upload
        end
      end
    end
  end
end
