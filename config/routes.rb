Sensomatica::Application.routes.draw do
  
  resources :history_points
  resources :points
  resources :alerts
  resources :offers
  root to: "home#index"
  get "home/index"
  get "control/index"
  post "control/index"
  get "dashboard/index"

  resources :constellations
  resources :type_objects
  resources :commands
  resources :photos
  resources :photo_sessions
  resources :reservs
  # resources :users

  resources :astronomic_objects

 

      devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  resources :readings, only: :index do
    collection do
      get :lab
      get :toxls
    end
  end


  resources :equipment




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
      resources :telescopestatus do
        collection do
          post :changestatus
        end
      end
    end
  end
end
