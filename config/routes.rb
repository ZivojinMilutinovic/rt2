Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/kontrolni_broj',to: 'pages#kontrolni_broj'
  resources :users,only:[:new,:create]
  resources :session,only:[:new,:create,:destroy]
  resources :konto_klasas
  resources :konto_grupas
  resources :konto_objektas
  resources :konto_sintetikas
  resources :konto_racunis
  #resource :kontrolni_broj,only:[:get]
end
