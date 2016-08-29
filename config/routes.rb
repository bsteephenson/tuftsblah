Rails.application.routes.draw do
  devise_for :users, skip: :registrations
  devise_scope :user do
    resource :registration,
      only: [:new, :create, :edit, :update],
      path: 'users',
      path_names: { new: 'sign_up' },
      controller: 'devise/registrations',
      as: :user_registration do
        get :cancel
      end
  end

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get '/' => 'post#index'
  get '/latest' => 'post#latest_posts'
  get '/ask' => 'post#posts_with_tag', tag_name: "Ask"
  get '/buysell' => 'post#posts_with_tag', tag_name: "Buy/Sell"
  get '/events' => 'post#posts_with_tag', tag_name: "Events"
  get '/user/' => 'user#index'
  get '/post/new' => 'post#new_post'
  post '/post/new' => 'post#new_post_submit'
  get '/post/:id/' => 'post#post_page'
  post '/post/:post_id/new_comment' => "post#new_comment"
  post '/post/like_or_unlike_post' => "post#like_or_unlike_post"
  post '/post/like_or_unlike_comment' => "post#like_or_unlike_comment"
  delete '/delete_comment/:id' => 'post#delete_comment'
  delete '/delete_post/:id' => 'post#delete_post'
  # get 'hello/' => 'hello#index'

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
