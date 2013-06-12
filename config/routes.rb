Saiddit::Application.routes.draw do
  root :to => 'subs#index'
  resources :subs
  resources :links

  resources :users
  resource :session, :only => [:new, :create, :destroy]

end
