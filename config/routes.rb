Rails.application.routes.draw do

  resources :user_monitors
  mount RailsAdmin::Engine => '/admin_panel', as: 'rails_admin'
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
  get '/store/:id' => 'stores#order_sheet', as: :order_sheet



  #routes sales controllers
  get '/sale/:id' => 'sales#factura_print'
  get "label_print" => "sales#label_print", as: :label_print
  get "label_print_e3" => "sales#label_print_e3", as: :label_print_e3
  get "label_print_e5" => "sales#label_print_e5", as: :label_print_e5







  get '/payment/:id' => 'payments#receipt_print', as: :receipt_print
  get 'activity/index'

  get 'accountability/index'

  get 'consulta/index'

  # get 'user_monitor/index'

  resources :suppliers
  get 'prices/home' => 'prices#home'
  get 'prices/show' => 'prices#show'

  post 'update_prices' => 'prices#update_prices', as: :update_prices

  devise_scope :user do
    get "/sign_in" => "devise/sessions#new"
    get "/sign_up" => "devise/sessions#new", as: "new_user_registration"
    get '/users/sign_out' => 'devise/sessions#destroy' 
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


  #routes reports controller
  get 'reports/index'
  get 'reports/orders_paid'
  # get 'reports/orders_paid_seq'
  get 'reports/orders_unpaid'
  get 'reports/pending_balance'
  get "orders_unpaid_print" => "reports#orders_unpaid_print", as: :orders_unpaid_print, :defaults => { :format => 'pdf' }
  get "orders_paid_print" => "reports#orders_paid_print", as: :orders_paid_print, :defaults => { :format => 'pdf' }
  get "orders_paid_seq_print" => "reports#orders_paid_seq_print", as: :orders_paid_seq_print, :defaults => { :format => 'pdf' }
  
  get "pending_balance_print" => "reports#pending_balance_print", as: :pending_balance_print, :defaults => { :format => 'pdf' }


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
