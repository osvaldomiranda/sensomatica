Sensomatica::Application.routes.draw do
  get "dashboard/index"
  resources :astronomic_objects

  devise_for :users
  resources :readings, only: :index do
    collection do
      get :lab
      get :toxls
    end
  end


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
