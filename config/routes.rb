Rails.application.routes.draw do
  scope "(:locale)", locale: /en|fr/ do
    get '/preferences', to: 'preferences#index', as: "preferences"
    get '/preferences/interests', to: 'interests#index', as: "preferences_interests"
    put '/preferences/interests', to: 'interests#edit', as: "edit_preferences_interests"
    get '/preferences/places', to: 'places#index', as: "preferences_places"
    put '/preferences/places', to: 'places#edit', as: "edit_preferences_places"

    # devise_for :users
    devise_scope :user do
      get "/login" => "devise/sessions#new" # custom path to login/sign_in
      get "/signup" => "devise/registrations#new", as: "signup" # custom path to sign_up/registration
    end
    devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', password: 'password', confirmation: 'confirmation', unlock: 'unlock', registration: 'register', sign_up: 'sign_up' }
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root 'homepage#index'
  end
end
