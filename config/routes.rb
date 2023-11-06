Rails.application.routes.draw do
  root "tops#index"
  get :sign_up, to: 'users#new'
  post :sign_up, to: 'users#create'
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  delete 'logout' => 'user_sessions#destroy', :as => :logout
  get 'home', to: 'homes#show'
  resource :users, only: %i[new create]
  resources :schedules
  resources :profiles
  resource :goal, only: %i[new create edit update destroy] do
    collection do
      post :skip
    end
  end
  resource :step, only: %i[new create edit update destroy]
end

