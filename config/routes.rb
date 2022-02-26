Rails.application.routes.draw do
  get 'session/new'
  get 'users/new'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  get '/logout', to: 'session#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
  root "static_pages#home"
  resources :users
end
