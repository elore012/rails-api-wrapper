Rails.application.routes.draw do
 root: 'wrappers#index'
  resources :wrappers
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


