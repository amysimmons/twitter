Rails.application.routes.draw do

  resources :tweets
  resources :users
  resources :relationships, only: [:create, :destroy]

  # This will add a favorite_tweet_path(@recipe) url helper for our view.
  resources :tweets do
    put :favourite, on: :member
  end

  root :to => 'pages#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/search' => 'users#search', :as => 'search'

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

  get '/:username/favourite/:id' => 'tweets#favourite', :as => 'username_favourite'

  put '/:username/favourite/:id' => 'tweets#favourite'

  get '/:username/retweet/:id' => 'tweets#retweet', :as => 'username_retweet'

  get '/:username/reply' => 'tweets#reply', :as => 'username_reply'

  post '/:username/retweet/:id' => 'tweets#retweet'

  post '/:username/reply' => 'tweets#reply'

  post '/:username/favourite/:id' => 'tweets#favourite'

  patch '/:username' => 'users#show_user'

end
