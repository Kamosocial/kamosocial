Rails.application.routes.draw do
  get 'homepage/index'

  # devise_for :users
  devise_scope :user do
    get "/login" => "devise/sessions#new" # custom path to login/sign_in
    get "/signup" => "devise/registrations#new" # custom path to sign_up/registration
  end
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', password: 'password', confirmation: 'confirmation', unlock: 'unlock', registration: 'register', sign_up: 'sign_up' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homepage#index'
end
