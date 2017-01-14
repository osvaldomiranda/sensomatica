Sensomatica::Application.routes.draw do
  resources :readings

  resources :equipment

  root to: "home#index"
  get "home/index"
end
