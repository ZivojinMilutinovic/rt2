Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/kontrolni_broj',to: 'pages#kontrolni_broj'
  get '/kursna_lista',to: 'pages#kursna_lista'
  get '/profile_page',to: 'pages#profile_page'
  resources :users,only:[:new,:create]
  resource :session,only:[:new,:create,:destroy]
  resources :konto_klasas,only:[:new,:create,:edit,:update,:destroy,:index]
  resources :konto_grupas,only:[:new,:create,:edit,:update,:destroy,:index]
  resources :konto_objektas,only:[:new,:create,:edit,:update,:destroy,:index]
  resources :konto_sintetikas,only:[:new,:create,:edit,:update,:destroy,:index]
  resources :konto_racunis,only:[:new,:create,:edit,:update,:destroy,:index]
  resources :partneris,only:[:new,:create,:edit,:update,:destroy,:index]
  resources :poreske_tarifes,only:[:new,:create,:edit,:update,:destroy,:index]
  resources :robas,only:[:new,:create,:edit,:update,:destroy,:index]
  resources :tip_robes,only:[:new,:create,:edit,:update,:destroy,:index]
  resources :magacinis,only:[:new,:create,:edit,:update,:destroy,:index]

  #resource :kontrolni_broj,only:[:get]
end
