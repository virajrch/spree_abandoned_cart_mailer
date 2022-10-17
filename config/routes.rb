Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :orders, :except => [:show] do  # <= add this block
      member do
        post :remind
      end
    end
  end
end
