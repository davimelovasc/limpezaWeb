Rails.application.routes.draw do
  devise_for :admins
  mount_devise_token_auth_for 'User', at: 'auth'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :tasks
      resources :spots


    end
  end

end
