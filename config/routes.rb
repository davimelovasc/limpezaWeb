Rails.application.routes.draw do
  devise_for :admins
  root 'spots#index'

  resources :spots


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1, path: "/" do
      mount_devise_token_auth_for 'User', at: 'auth'

      get "/spots", to: "spots#index"
      put "/spots/:id", to: "spots#update"
      post "/spots", to: "spots#complete_spot"
    end
  end

end
