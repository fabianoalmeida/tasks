Tasks::Application.routes.draw do
  
  resources :tasks

  resources :lists

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  
  authenticated :user do
    root to: 'lists#index'
  end

  devise_for :users

  root :to => "home#index"
  
end
