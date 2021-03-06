Masterit::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  scope "(:locale)", :locale => /ru|en|de/ do
    scope :module => :web do
      root to: 'pages#index'
      resources :feedback
      resource :session
      resources :subscribers
      
      post '/members/upload' => 'members#upload'
      post '/members/upload-avatar' => 'members#upload_avatar'
      resources :members do
        # post :upload
      end
      resources :news_categories do
        resources :news
      end

      namespace :admin do
        root to: 'dashboard#index'
        
        resources :dashboard

        resources :settings
        resources :users
        resources :pages
        resources :subscribers
        resources :menus do
          resources :menu_items
        end
        
        resources :feedback do
          post :respond
        end
        
        resources :members
        resources :nominations
        resources :news
        resources :news_categories
      end

      match '/(:slug)' => 'pages#show', as: :page
    end 
  end


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
