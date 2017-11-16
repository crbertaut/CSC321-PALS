Rails.application.routes.draw do
  
  devise_for :users, path: 'volunteers', path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }, controllers: { registrations: "users/registrations" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'posts#index'
  
  get '/volunteers/profiles/:id', to: 'users#show', as: :user
  # get '/volunteers/profiles/:id/edit', to: 'devise/registrations#edit', as: :edit_user_profile
  
  resources :posts

end
