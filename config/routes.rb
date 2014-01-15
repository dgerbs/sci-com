Sci::Application.routes.draw do

  devise_for :users do
    member do
      get :following, :followers
    end
  end
  
  resources :antibodies
  resources :relationships, only: [:create, :destroy]

  root 'pages#home'

  get 'about'   => 'pages#about'
  get 'contact' => 'pages#contact'

end
