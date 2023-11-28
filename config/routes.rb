Rails.application.routes.draw do
  root "top#index"
  get :sign_up, to: 'users#new'
  post :sign_up, to: 'users#create'
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  delete 'logout' => 'user_sessions#destroy', :as => :logout
  resource :home, only: %i(show) do
    post 'add_day_check', on: :member
  end
  resource :users, only: %i(new create)
  resources :schedules
  resource :profiles
  resource :goal, only: %i(new create edit update destroy) do
    collection do
      post :skip
    end
  end
  resource :step, only: %i(new create edit update destroy)
end

