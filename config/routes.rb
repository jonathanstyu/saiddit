Saiddit::Application.routes.draw do
  resources :subs


  resources :users
  resource :session

end
