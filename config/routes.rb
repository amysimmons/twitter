Rails.application.routes.draw do

  resources :tweets
  resources :users
  resources :relationships, only: [:create, :destroy]


  root :to => 'pages#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'


  get '/:username' => 'users#show_user', :as => 'username'

  get '/:username/edit' => 'users#edit_user', :as => 'username_edit'

  patch '/:username/update' => 'users#update_user', :as => 'username_update'

  get '/:username/newsfeed' => 'tweets#newsfeed', :as => 'username_newsfeed'

  get '/:username/news' => 'tweets#news', :as => 'username_news'

  get '/:username/all' => 'tweets#all', :as => 'username_all'

  get '/:username/mentions' => 'tweets#mentions', :as => 'username_mentions'

  get '/:username/tweets' => 'users#tweets', :as => 'username_tweets'

  get '/:username/following' => 'users#following', :as => 'username_following'

  get '/:username/followers' => 'users#followers', :as => 'username_followers'

  get '/:username/retweet' => 'tweets#retweet', :as => 'username_retweet'

  get '/:username/reply' => 'tweets#reply', :as => 'username_reply'

  get '/:username/favourite' => 'tweets#favourite', :as => 'username_favourite'

  post '/:username/retweet' => 'tweets#retweet'

  post '/:username/reply' => 'tweets#reply'

  post '/:username/favourite' => 'tweets#favourite'

  patch '/:username' => 'users#show_user'

  # get '/:username/delete' => 'users#show_user'


end
