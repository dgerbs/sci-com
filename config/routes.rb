Sci::Application.routes.draw do
  
  devise_for :users

  root 'pages#home'

  get 'about'   => 'pages#about'
  get 'contact' => 'pages#contact'

end
