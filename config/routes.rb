Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips do
    resources :trip_users, only: [:new, :create, :destroy]
  end
  get 'my_trips', to: 'users#show_trips'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
