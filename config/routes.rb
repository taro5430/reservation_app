Rails.application.routes.draw do
  post '/rooms/new', to: 'rooms#create'
  get '/rooms/search', to: 'rooms#search'
  post 'rooms/:id', to: 'rooms#show'
  get '/user/account', to: 'users#account'
  get '/user/profile', to: 'users#profile'
  patch '/user/profile', to: 'users#update'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :rooms
  resources :users
  resources :rooms do
    post 'reservation/confirm', to: 'reservations#confirm'
    post 'reservation', to: 'reservations#create'
  end
  resources :reservations,only: [:index, :show]
  get 'static_pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:'static_pages#home'
  
end
