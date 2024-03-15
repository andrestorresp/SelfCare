Rails.application.routes.draw do
  # devise_for :users
  root to: "pages#home"
  devise_for :users, :controllers => {:registrations => "registrations"}

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "patients/buscar_px", to: "patients#buscar_px", as: :buscar
  resources :doctors
  resources :patients do
    resources :consultations, only: [:new, :create, :edit, :update]
    resources :diagnoses, only: [:new, :create]
  end
  resources :blogs
  resources :consultations, except: %i[new create]
end
