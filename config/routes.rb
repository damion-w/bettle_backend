Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Tests connection between backend and UI
  get "/" => "users#test"
  
  # Call create method on SessionsController class
  post '/login'  => 'sessions#create'

  # Call destroy method on SessionsController class
  delete '/logout' => 'sessions#destroy'
 
  # Call profile method on Users class class
  get '/profile' => 'users#profile'
  
  resources :users, only: [:show, :create, :update]
  
  resources :events do
    resources :expenses, only: [:index, :show, :create, :destroy, :update]
  end

  resources :events do
    resources :users_events, only: [:create, :destroy, :update]
  end
  
end
