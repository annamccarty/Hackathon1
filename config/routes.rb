Rails.application.routes.draw do
  root to: 'accounts#index'

  devise_for :users, controllers: {
   registrations: 'users/registrations'
 }

 resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
