Rails.application.routes.draw do
  root to: 'home#index'
  get 'canvas', to: 'home#index'
  get 'test', to: 'home#test'

  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/'), via: [:get, :post]
  delete 'signout', to: 'sessions#destroy', as: 'signout'

end
