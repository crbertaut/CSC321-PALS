Rails.application.routes.draw do
  
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get  '/signup',  to: 'users#new'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'posts#index'

  resources :posts

end
