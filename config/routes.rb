Sensomatica::Application.routes.draw do
  
  
  resources :commands

  resources :photos

  resources :photo_sessions

  resources :reservs

  get "control/index"
  post "control/index"


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
      resources :command do
        collection do
          get :getcommand
        end
      end
      resources :photos do
        collection do
          post :upload
        end
      end
    end
  end
end
