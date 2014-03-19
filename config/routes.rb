Sci::Application.routes.draw do

  devise_for :users

  resources :users do
    member do
      get :following, :followers
    end
    resources :ihcprotocols
    resources :ibprotocols
    resources :ifprotocols
    resources :ipreprotocols
    resources :flowprotocols
  end
  
  resources :antibodies do
    post :vote, on: :member
    resources :ihcprotocols
    resources :ibprotocols
    resources :ifprotocols
    resources :ipreprotocols
    resources :flowprotocols
  end

  resources :ihcprotocols
  resources :ibprotocols
  resources :ifprotocols
  resources :ipreprotocols
  resources :flowprotocols
  
  resources :relationships, only: [:create, :destroy]

  resources :publications, except: :index

  root 'pages#home'

  get 'about'   => 'pages#about'
  get 'contact' => 'pages#contact'

end
