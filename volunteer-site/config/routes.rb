Rails.application.routes.draw do
  
  resources :users do
    resources :interests
  end
  
  get  '/signup',  to: 'users#new'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
