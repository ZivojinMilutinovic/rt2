Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/kontrolni_broj',to: 'pages#kontrolni_broj'
  resources :users,only:[:new,:create]
  resource :session,only:[:new,:create,:destroy]
  #resource :kontrolni_broj,only:[:get]
end
