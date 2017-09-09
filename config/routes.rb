Rails.application.routes.draw do
  root to: 'accounts#index'
  resources :users do
    resources :bios
  end
  devise_for :users, controllers: {
   registrations: 'users/registrations'
 }

 resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
