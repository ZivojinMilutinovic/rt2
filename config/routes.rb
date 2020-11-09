Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/kontrolni_broj',to: 'pages#kontrolni_broj'
  get '/kursna_lista',to: 'pages#kursna_lista'
  resources :users,only:[:new,:create]
  resource :session,only:[:new,:create,:destroy]
  resources :konto_klasas,only:[:new,:create,:edit,:update,:destroy,:index]
  resources :konto_grupas,only:[:new,:create,:edit,:update,:destroy,:index]
  resources :konto_objektas,only:[:new,:create,:edit,:update,:destroy,:index]
  resources :konto_sintetikas,only:[:new,:create,:edit,:update,:destroy,:index]
  resources :konto_racunis,only:[:new,:create,:edit,:update,:destroy,:index]
  #resource :kontrolni_broj,only:[:get]
end
