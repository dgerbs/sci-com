Sci::Application.routes.draw do

  devise_for :users 
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :antibodies, shallow: true do
    resources :ihcprotocols, only: [:new, :create]
    resources :ibprotocols, only: [:new, :create]
  end

  resources :ihcprotocols, except: [:new, :create]
  resources :ibprotocols, except: [:new, :create]
  resources :relationships, only: [:create, :destroy]

  root 'pages#home'

  get 'about'   => 'pages#about'
  get 'contact' => 'pages#contact'

end
