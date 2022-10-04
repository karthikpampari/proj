Rails.application.routes.draw do
  root 'cars#login'
  get "products/:id/add_to_warehouse" ,as: "addtowarehouse",to: "warehouses#addtowarehouse"
  resources :warehouses
  resources :customers
  get "products/:id/buy_product" ,as: "buyproduct",to: "products#buy_product"
  get "products/myproducts",as: "myproducts",to: "products#myproducts"
  resources :products
  devise_for :users
    
end
