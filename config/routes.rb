Rails.application.routes.draw do
  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider
  root "top#index"
  get :sign_up, to: 'users#new'
  post :sign_up, to: 'users#create'
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  delete 'logout' => 'user_sessions#destroy', :as => :logout
  resources :home, only: %i[index]
  resource :users, only: %i(edit update)
  resources :schedules
  resources :profiles, only: %i(index)
  resource :characters, only: [:edit, :update]
  resource :goal, only: %i(new create edit update) do
    collection do
      post :skip
    end
  end
  resources :steps, only: %i(new create destroy) do
    collection do
      get :edit
      put :update
    end
    post :day_check, on: :member
  end
end

