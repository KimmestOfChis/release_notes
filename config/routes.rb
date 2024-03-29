Rails.application.routes.draw do
  resources :interactions
  resources :iterations do
      member do 
          get 'new_defect'
          get 'new_interaction'
          get 'view_report'
          get 'clone_defect'
          get 'submit_clone'
          get 'clone_interaction'
          get 'submit_interaction'
      end
  end
  resources :defects
  resources :lines do
      member do
          get 'add_to'
          get 'leave'
      end
  end
  devise_for :users
 root to: 'pages#home'
 get 'issues', to: 'pages#issues'
 get 'my-profile', to: 'pages#my_profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
