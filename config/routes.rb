# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#            reports_index GET    /reports/index(.:format)       reports#index
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                   orders GET    /orders(.:format)              orders#index
#                          POST   /orders(.:format)              orders#create
#                new_order GET    /orders/new(.:format)          orders#new
#               edit_order GET    /orders/:id/edit(.:format)     orders#edit
#                    order GET    /orders/:id(.:format)          orders#show
#                          PATCH  /orders/:id(.:format)          orders#update
#                          PUT    /orders/:id(.:format)          orders#update
#                          DELETE /orders/:id(.:format)          orders#destroy
#                  clients GET    /clients(.:format)             clients#index
#                          POST   /clients(.:format)             clients#create
#               new_client GET    /clients/new(.:format)         clients#new
#              edit_client GET    /clients/:id/edit(.:format)    clients#edit
#                   client GET    /clients/:id(.:format)         clients#show
#                          PATCH  /clients/:id(.:format)         clients#update
#                          PUT    /clients/:id(.:format)         clients#update
#                          DELETE /clients/:id(.:format)         clients#destroy
#                          GET    /reports/index(.:format)       reports#index
#            welcome_index GET    /welcome/index(.:format)       welcome#index
#                     root GET    /                              welcome#index
#

Rails.application.routes.draw do

  get 'activity/index'

  get 'accountability/index'

  get 'consulta/index'

  resources :suppliers

  devise_scope :user do
    get "/sign_in" => "devise/sessions#new"
    get "/sign_up" => "devise/sessions#new", as: "new_user_registration"
  end

  get 'admin/index'
  get 'orders/orders_completed'
  get 'orders/orders_test'
  get 'orders/orders_process'
  get 'orders/orders_urgent'
  resources :items

  resources :categories

  get 'reports/index'

  devise_for :users
  resources :users_admin, :controller => 'users'
  resources :orders
  resources :clients

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
