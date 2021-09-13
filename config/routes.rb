Rails.application.routes.draw do
  root 'transactions#index'

  get '/payer_balances', to: 'transactions#index'
  post '/add_transaction', to: 'transactions#create_t'
  post '/spend_points', to: 'transactions#spend_pts'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
