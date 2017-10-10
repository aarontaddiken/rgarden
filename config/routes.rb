Rails.application.routes.draw do
  resources :product_prices
  resources :products
  resources :orders
  resources :order_shipments
  resources :order_items
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
