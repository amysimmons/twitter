Rails.application.routes.draw do

  resources :tweets
  resources :users

  root :to => 'pages#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/:username' => 'users#show_user'

end
