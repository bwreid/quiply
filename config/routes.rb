TwitterClone::Application.routes.draw do
  root :to => 'welcome#index'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :session, :only => [:new, :create, :destroy]

  resources :users do
    collection do
      get 'edit'
    end
  end

  resources :tweets, :except => [:edit]
  resources :hashtags, :only => [:show]
end
