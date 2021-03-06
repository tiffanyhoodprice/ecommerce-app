Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :suppliers
  
  resources :products
  # get '/products', to: 'products#index'
  # # get '/add_product', to: 'products#add_product'
  # # post '/create_product', to: 'products#create_product'
  # get '/products/new', to: 'products#new'
  # post '/products', to: 'products#create'
  # get '/products/:id', to: 'products#show'
  # get '/products/:id/edit', to: 'products#edit'
  # patch '/products/:id/edit', to: 'products#update'
  # delete '/products/:id', to: 'products#destroy'
  # get '/contact', to: 'products#contact'
  # post '/products/search', to: 'products#search'

  
  post '/orders', to: 'orders#create'
  get '/orders/:id', to: 'orders#show'
  patch '/orders/:id/edit', to: 'orders#update'

  get '/carted_products', to: 'carted_products#index'
  post '/carted_products', to: 'carted_products#create'
  get '/carted_products/:id', to: 'carted_products#show'
  delete '/carted_products/:id', to: 'carted_products#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
