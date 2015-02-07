Rails.application.routes.draw do
  resources :tweets
  resources :users

  root :to => 'pages#home'
end
