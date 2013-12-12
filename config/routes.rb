DeliciouslyPortugalV2::Application.routes.draw do

  devise_for :users
  root :to => 'main#index'
  #admin section
  namespace :admin do
    get 'products/list_suggestions' => 'products#list_suggestions'
    get 'payments/show_payment_plan' => 'payments#show_payment_plan'
    match 'products/list_suggestions/:id' => "products#list_suggestions"
    match 'products/activate/:id' => "products#activate"
    get 'products/product_month' => "products#product_month"
    post 'products/set_prod_month' => 'products#set_prod_month'

    resources :products  
    resources :categories	
    resources :clients
    resources :news
    
    match 'products/prods_category/:id' => "products#prods_category"
    match 'products/list_all_products/:id' => "products#list_all_products"

    namespace :configuration do
      resources :client_types
      resources :service_modalities
    end
    root :to => 'main#index'	
  end
  
  resources :products
  resources :news 

  match 'main/index' => 'main#index'

  match 'contacts' => 'contacts#index'

  match 'products/prods_by_category/:id' => 'products#prods_by_category'



  get 'contacts/index'
  get 'contacts/suggest'=>'contacts#suggest_food'
  post 'contacts/sendemail'
  post 'contacts/send_suggest'
  get 'contacts/advertise'
  post 'contacts/send_advertise'
  match 'about' => 'main#about_us'
  get 'main/terms_conditions'
  get 'contacts/interest'
  post 'contacts/send_client_interest'
  match 'faq' => 'main#faq'
  match 'donate' => 'main#donate'
  match 'newsletter'=>'main#newsletter'
  match 'sponsors' => 'main#sponsors'
  match 'portuguese'=> 'main#portuguese'
    match 'portuguese-map'=> 'main#portuguese_map'

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
