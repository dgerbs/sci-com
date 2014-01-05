Sci::Application.routes.draw do
  
  resources :antibodies

  devise_for :users

  root 'pages#home'

  get 'about'   => 'pages#about'
  get 'contact' => 'pages#contact'

end
