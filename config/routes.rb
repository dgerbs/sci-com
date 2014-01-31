Sci::Application.routes.draw do

  devise_for :users 
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :antibodies, shallow: true do
    resources :ihcprotocols
    resources :ibprotocols,    only: [:new, :create]
    resources :ifprotocols,    only: [:new, :create]
    resources :ipreprotocols,  only: [:new, :create]
  end

  resources :ihcprotocols
  resources :ibprotocols,   except: [:new, :create]
  resources :ifprotocols,   except: [:new, :create]
  resources :ipreprotocols, except: [:new, :create]
  
  resources :relationships, only: [:create, :destroy]

  root 'pages#home'

  get 'about'   => 'pages#about'
  get 'contact' => 'pages#contact'

end
