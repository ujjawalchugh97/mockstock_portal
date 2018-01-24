Rails.application.routes.draw do
  resources :stocks
  devise_for :admins, controllers: { registrations: "registrations"}
  get 'portal/index'

  root 'home#index'
  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/portal/buy_stock' => 'portal#buy_stock'
end
