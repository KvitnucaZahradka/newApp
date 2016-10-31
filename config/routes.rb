###SampleApp::Application.routes.draw do
####Rails.application.routes.draw do
###  resources :users do
###    member do
###      get :following, :followers
###    end
###  end
###  resources :sessions,      only: [:new, :create, :destroy]
###  resources :microposts,    only: [:create, :destroy]
###  resources :relationships, only: [:create, :destroy]
###  root to: 'static_pages#home'
###  match '/signup',  to: 'users#new',            via: 'get'
###  match '/login',  to: 'sessions#new',         via: 'get'
###  match '/logout', to: 'sessions#destroy',     via: 'delete'
###  match '/help',    to: 'static_pages#help',    via: 'get'
###  match '/about',   to: 'static_pages#about',   via: 'get'
###  match '/contact', to: 'static_pages#contact', via: 'get'
###  match '/login' to: 'sessions#create', via: 'post'
###end



Rails.application.routes.draw do

 get 'sessions/new'
 get 'users/new'

 root to: 'static_pages#home'
 get '/help', to: 'static_pages#help'
 get '/about', to: 'static_pages#about'
 get '/contact', to: 'static_pages#contact'
 get '/signup', to: 'users#new'
 get '/login', to: 'sessions#new'
 post '/login', to: 'sessions#create'
 # get '/edit', to: 'sessions#edit'
 # post '/edit', to: 'sessions#edit'
 delete '/logout', to: 'sessions#destroy'

 resources :users
 resources :account_activations, only: [:edit]

 # root 'static_pages#home'

  #get 'static_pages/help'

 # get 'static_pages/about'

 # get 'static_pages/contact'

 # get 'static_pages/contact'


  # resources :microposts
 # resources :users

 # root 'users#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'application#hello'

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
