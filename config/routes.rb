Rails.application.routes.draw do
  
  devise_for :people, path: 'volunteers', path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }, controllers: { registrations: "people/registrations" }
  devise_for :organizations, path: 'organizations', path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }, controllers: { registrations: "organizations/registrations" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'users#index'
  
  get '/volunteers/profiles/:id', to: 'people#show', as: :person
  get '/volunteers', to: 'people#index', as: :people
  
  get '/organizations', to: 'organizations#index', as: :organizations

end
