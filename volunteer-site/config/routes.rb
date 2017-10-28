Rails.application.routes.draw do
  
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_scope :user do
    # get  '/signup',  to: 'devise/registrations#new'
    root :to => redirect('/users/sign_up')
  end
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
