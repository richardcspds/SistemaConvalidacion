Rails.application.routes.draw do
  resources :relacions
  resources :estudiantes
  resources :personas
  resources :convalidacions
  resources :asignaturas
  resources :pensums
  resources :carreras
  resources :universidads
  devise_for :users
  get 'pages/info'
  root to: redirect('/convalidacions')
  resources :ideas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
