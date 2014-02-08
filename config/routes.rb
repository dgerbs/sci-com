Sci::Application.routes.draw do

  devise_for :users

  resources :users, shallow: true do
    member do
      get :following, :followers
    end
    resources :ihcprotocols
    resources :ibprotocols
    resources :ifprotocols
    resources :ipreprotocols
  end
  
  resources :antibodies, shallow: true do
    post :vote, on: :member
    resources :ihcprotocols
    resources :ibprotocols
    resources :ifprotocols
    resources :ipreprotocols
  end

  resources :ihcprotocols
  resources :ibprotocols
  resources :ifprotocols
  resources :ipreprotocols
  
  resources :relationships, only: [:create, :destroy]

  resources :publications, except: :index

  root 'pages#home'

  get 'about'   => 'pages#about'
  get 'contact' => 'pages#contact'

end
