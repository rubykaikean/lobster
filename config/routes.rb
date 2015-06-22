Rails.application.routes.draw do

  resources :email_settings
  resources :regions
  resources :sources_types
  resources :product_settings
  resources :reservations do
    member do
      post "create_lot"
      get "buyer"
    end
  end

  resources :reports do
    collection do
      get "summary_report"
      get "analysis_report"
    end
  end
  
  resources :buyers
  resources :company_settings 

  resources :sales do
    collection do
      post "confirm_sales"
      post "reject_sales"
    end
  end

  devise_for :admins, :controllers => { :sessions => "super_admin/sessions", :registrations => "super_admin/registrations"  } # :skip => :registrations,
  devise_for :users, :controllers => { :registrations => :registrations, :sessions => :sessions  }

  resources :users do
    collection do
      post "create_member"
    end
    member do
      patch "update_member"
    end
  end

  resources :lots do 
    member do
      post "bulk_update"
    end
  end

  resources :product_types do 
    collection do 
      post "update_product_type"
    end
  end

  resources :products do 
    collection do
      post "create_lot"
    end
    member do
      post "update_email_setting"
      post "update_setting"
      post "update_region"
      post "update_sources_type"
      get "site_plans"
      get "floor_plans"
    end
    resources :site_plans
    resources :floor_plans
  end

  resources :phases do 
    collection do 
      post "update_product"
    end
  end

  resources :projects do
    collection do
      post "update_project"
      post "update_phase"
    end
  end

  mount RailsEmailPreview::Engine, at: 'emails'

  resources :companies do
    member do
      post "update_setting"
      patch "update_profile"
    end
    collection do
      get "profile"
    end
  end

  namespace :super_admin do
    resources :admins
    resources :companies do
      member do
        post "update_setting"
      end
    end
  end
  
  get 'supermin_board' => 'super_admin/dashboard#index', as: :supermin_board
  root 'dashboard#index'

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
