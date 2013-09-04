IcodeUni::Application.routes.draw do
  
  resources :projects

  resources :fomulations

  resources :estimations do
    get :autocomplete_estimation_title, :on => :collection
    collection do
      get "station_estimation"
    end
  end

  resources :estimation_items

  resources :stations do

    collection do
      match 'search' => 'stations#search', :via => [:get, :post], :as => :search
      get "standard_project_station"
      get "standard_project_estimation"
    end
  end


  resources :products do
    get :autocomplete_product_name, :on => :collection
    collection do
      get "product_station"
      get "show_standard_project"
      get "show_standard_station"
      get "show_standard_estimation"
      get "add_standard_estimation"
    end
  end
  

  resources :materials do
    member do
      get "estimation_item"
    end
  end

  resources :drawings do
    collection do
      get "pdf_drawing_pic"
    end
  end

  resources :clients do
    get :autocomplete_client_name, :on => :collection
  end




  get "home/index"
  devise_for :users #, :controllers => {:registrations => "registrations"}
  resources :users do
    get :autocomplete_user_username, :on => :collection
    member do      
      get :edit_user      
      patch :update_user    
    end
    collection do
      get :new_user       
      post :create_user
    end       
  end

    resources :roles         
     
  

  # devise_for :admins
 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root :to => "home#index"

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
