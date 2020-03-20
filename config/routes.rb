Rails.application.routes.draw do
  get 'posts/index'
  root 'static_pages#home'
  get  '/login',     to: 'sessions#new'
  post '/login',     to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get  '/signup',    to: 'users#new'
  post '/signup',    to: 'users#create'
  resources :users, except: %i[new create]
  get  '/posts',     to: 'posts#index'
  get  '/posts/new', to: 'posts#new'
  post '/posts', to: 'posts#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
