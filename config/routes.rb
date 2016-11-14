Rails.application.routes.draw do

  resources :payments do
    collection do
      get 'make_payment'
    end
  end
  resources :procedures
  resources :gcolors
  resources :mcolors
  resources :materials
  resources :worktypes
  resources :stores

  resources :sales do
    resources :stores
  end


  get 'activity/index'

  get 'accountability/index'

  get 'consulta/index'

  resources :suppliers
  get 'prices/home' => 'prices#home'
  get 'prices/show' => 'prices#show'

  post 'update_prices' => 'prices#update_prices', as: :update_prices

  devise_scope :user do
    get "/sign_in" => "devise/sessions#new"
    get "/sign_up" => "devise/sessions#new", as: "new_user_registration"
  end

  get 'admin/index'
  get 'admin/servicios'
  # get 'orders/orders_completed'
  # get 'orders/orders_test'
  # get 'orders/orders_process'
  # get 'orders/orders_urgent'
  get '/order/:id' => 'orders#label_print'


  resources :items

  resources :categories

  get 'reports/index'

  devise_for :users
  resources :users_admin, :controller => 'users'
  resources :orders
  resources :clients
  resources :users

  get 'reports/index'
  get 'admin/index'
  get 'welcome/index'
  root 'welcome#index'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
