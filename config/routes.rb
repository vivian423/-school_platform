Rails.application.routes.draw do
  get 'errors/not_found'
  get 'meetings/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  devise_for :users
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard'

  resources :photos, only: %i[index show new create destroy]

  resources :meetings, only: :index

  resources :activities

  resources :chatrooms, only: :index do
    resources :messages, only: :create
  end

  match "*path", to: "errors#not_found", via: :all
  get '/500', to: 'errors#internal_server'
end
