Rails.application.routes.draw do

  resources :mail_messages

  post 'like/:model_name/:id' => 'like#new', :as => :like_path
  delete 'like/:model_name/:id' => 'like#destroy', :as => :unlike_path


  get 'comments_index' => 'comment#index', :as => :comments
  post 'comment' => 'comment#create', :as => :comment_create_path
  delete 'comment/:id' => 'comment#destroy', :as => :comment_destory_path


  resources :post_attachments

  resources :magazines

  resources :groups

  get 'flats/:name' => 'flat#show'


  resources :categories

  mount Ckeditor::Engine => '/ckeditor'
  resources :profiles

  resources :posts

  root to: 'posts#index'
  devise_for :users

  # noinspection RailsParamDefResolve
  resource :blog, :only => [:edit, :update]

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
