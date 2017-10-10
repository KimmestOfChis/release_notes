Rails.application.routes.draw do
  devise_for :users
 root to: 'pages#home'
 get 'issues', to: 'pages#issues'
 get 'my-profile', to: 'pages#my_profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
