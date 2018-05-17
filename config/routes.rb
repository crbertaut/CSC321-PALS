Rails.application.routes.draw do
  post 'shifts/import', to: 'shifts#import'

  devise_for :users, path: 'volunteers', path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }, controllers: { registrations: "users/registrations" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'users#index'
  
  get '/volunteers/profiles/:id', to: 'users#show', as: :user
  get '/volunteers', to: 'users#index', as: :users

end
