Tasks::Application.routes.draw do
  
  match 'public_lists' => 'public_list#index'

  resources :lists do
    resources :tasks
  end

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
