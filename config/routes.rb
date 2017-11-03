Rails.application.routes.draw do
  
  #devise_for ActiveAdmin::Devise.config
  #devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  #devise_for :users
  
  #devise_scope :user do
  #root :to => redirect('/users/sign_up')
  #end
  
  get  '/signup',  to: 'users#new'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'posts#index'

  resources :posts

end
