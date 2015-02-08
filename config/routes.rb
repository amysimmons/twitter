Rails.application.routes.draw do

  resources :tweets
  resources :users

  root :to => 'pages#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/:username' => 'users#show_user', :as => 'username'

  get '/:username/edit' => 'users#edit_user', :as => 'username_edit'

  patch '/:username/update' => 'users#update_user', :as => 'username_update'


  # get '/:username/delete' => 'users#show_user'

end
