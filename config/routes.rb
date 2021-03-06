Rails.application.routes.draw do
    resources :comments
  
  
  resources :posts
  get 'friends/my'
  get 'friends/friended_by'

  resources "messages" do
    collection do
      get :inbox
      get :sent
    end
  end

  resources :posts do 
    get :paging, on: :collection
  end 
 
  get "friends" => "friends#index"
  get "profile" => "users#edit"
  # NOTE: /auth/facebook is supported by the omniauth-facebook gem

  get 'auth/:provider/callback' => 'sessions#callback'

  delete "remove_friend" => "friendships#destroy"
  resources :friendships

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  
  resources :users do
    get :search,  on: :collection
end

  root 'home#index'
  post "toggle_like" => "likes#toggle"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
