Rails.application.routes.draw do
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
  post '/shorts/execute' => 'shorts#execute'
end
