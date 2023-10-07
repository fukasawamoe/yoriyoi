Rails.application.routes.draw do
  root "tops#index"
  get :sign_up, to: 'users#new'
  post :sign_up, to: 'users#create'
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  delete 'logout' => 'user_sessions#destroy', :as => :logout
  resources :users
  resources :homes
  resources :tasks
  resources :schedules
  resources :profiles
  resources :goals do
    collection do
      post :skip  # 新たなルートを追加します。
    end
  end
  resources :steps
end

