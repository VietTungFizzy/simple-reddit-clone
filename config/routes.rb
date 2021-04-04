Rails.application.routes.draw do
  match "profile/:username" => "public#profile", :via => :get, :as => :profile
  resources :communities do
    resources :posts
  end
  devise_for :accounts
  root to: "public#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
