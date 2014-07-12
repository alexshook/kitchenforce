Rails.application.routes.draw do
  root to: 'home#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
