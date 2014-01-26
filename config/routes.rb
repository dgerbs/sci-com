Sci::Application.routes.draw do

  devise_for :users 
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :antibodies, shallow: true do
    resources :ihcprotocols, only: [:new, :create, :index]
    resources :ibprotocols,  only: [:new, :create, :index]
    resources :ifprotocols,  only: [:new, :create, :index]
  end

  resources :ihcprotocols, except: [:new, :create, :index]
  resources :ibprotocols,  except: [:new, :create, :index]
  resources :ifprotocols,  except: [:new, :create, :index]
  resources :relationships, only: [:create, :destroy]

  root 'pages#home'

  get 'about'   => 'pages#about'
  get 'contact' => 'pages#contact'

end
