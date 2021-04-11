Rails.application.routes.draw do
  match "profile/:username" => "public#profile", :via => :get, :as => :profile
  resources :communities do
    resources :posts
  end
  resources :subscriptions
  resources :comments, only: [:create]
  devise_for :accounts
  root to: "public#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
