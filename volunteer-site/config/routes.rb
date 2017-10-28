Rails.application.routes.draw do
  
  # devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  devise_for ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users
  devise_scope :user do
    root :to => redirect('/users/sign_up')
  end
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
