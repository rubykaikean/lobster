Rails.application.routes.draw do

  resources :buyers
  resources :company_settings 

  resources :sales

  devise_for :admins, :controllers => { :sessions => "super_admin/sessions", :registrations => "super_admin/registrations"  } # :skip => :registrations,
 
  resources :admins

  devise_for :users, :controllers => { :registrations => :registrations, :sessions => :sessions  }

  resources :users do
    collection do
      post "create_member"
    end
    member do
      patch "update_member"
    end
  end

  resources :lots

  resources :product_types do 
    collection do 
      post "update_product_type"
    end
  end

  resources :products do 
    collection do
      post "create_lot"
    end
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
  end

  namespace :super_admin do
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
