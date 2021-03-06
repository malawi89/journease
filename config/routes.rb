Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :trips do
    resources :trip_users, only: [:new, :destroy]
    resources :journeys, except: [:index]
    resources :accommodations, except: [:index]
    resources :activities, except: [:index]
    post 'trip_users', to: 'trip_users#add_friend', as: :user_add
  end
  get 'my_trips', to: 'trips#all'
  resources :users, only: [:show]
  # get 'my_trips', to: 'users#show_trips'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
