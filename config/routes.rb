Saiddit::Application.routes.draw do
  root :to => 'subs#index'
  resources :subs
  resources :links, :except => [:index] do 
    resources :comments, :only => [:create, :destroy]
    post 'upvote'
    post 'downvote'
  end

  resources :users
  resource :session, :only => [:new, :create, :destroy]
  
  resources :comments, :only => [:show] do 
    post 'reply'
  end

end
