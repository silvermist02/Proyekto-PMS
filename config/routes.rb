Proyekto::Application.routes.draw do

  post 'users' => 'users#create' #override devise's registration to maintain RESTful interface


  devise_for :users, :maximum_attempts => 3, :unlock_strategy => :time, :unlock_in => 1, :controllers => { :confirmations => 'users/confirmations' }
  
  resources :users do
    member do
      get 'unlock', :to => 'users#unlock'
    end
  end
    
  resources :projects do
    
  	member do
  		get 'add_member', :to => 'projects#add_member'
  		get 'remove_member', :to => 'projects#remove_member'
  		get 'members', :to => 'projects#members'
  		put 'members_update', :to => 'projects#members_update'
  		
    end
    
    get 'overview', :to => 'projects#overview'
    resources :tickets do
    	member do
    		get 'assign', :to => 'tickets#assign'
    	end
      collection do
  		  get 'search', :to => 'tickets#search'
      end
    end
  end
  
  resources :tickets do
  	member do
  		get 'log_time', :to => 'tickets#log_time'
  	end
    resources :comments
  end
  
  resources :roles
  
  root :to => "application#index"
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
