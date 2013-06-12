Saiddit::Application.routes.draw do
  root :to => 'subs#index'
  resources :subs
  resources :links do 
    resources :comments, :only => [:create, :destroy]
  end
  

  resources :users
  resource :session, :only => [:new, :create, :destroy]

end
