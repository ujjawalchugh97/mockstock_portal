Rails.application.routes.draw do
  get 'market/index'

  resources :mars
  resources :bfutures
  resources :ex_rates
  get 'futures/index'

  resources :sfutures
  get 'shorts/index'

  resources :stocks
  devise_for :admins, controllers: { registrations: "registrations"}
  get 'portal/index'

  root 'home#index'
  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/portal/buy_stock' => 'portal#buy_stock'
  post '/portal/sell_stock' => 'portal#sell_stock'
  post '/portal/short_stock' => 'portal#short_stock'
  post '/portal/buy_sfuture' => 'portal#buy_sfuture'
  post '/portal/buy_bfuture' => 'portal#buy_bfuture'
  post '/portal/buy_coin' => 'portal#buy_coin'
  post '/portal/sell_coin' => 'portal#sell_coin'
  post '/portal/ex_cur' => 'portal#ex_cur'
  post '/shorts/execute' => 'shorts#execute'
  post '/futures/execute_s' => 'futures#execute_s'
  post '/futures/execute_b' => 'futures#execute_b'
  post '/market/new' => 'market#new'

end
