Rails.application.routes.draw do
  
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get  '/signup',  to: 'users#new'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
