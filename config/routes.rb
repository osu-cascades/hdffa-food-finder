Rails.application.routes.draw do

  namespace :admin do
    get 'featured_listings/create'
  end
  devise_scope :user do
    root to: "admin/welcome#home"
  end

  # Users
  # Using Devise RegistrationsController for public user creation/registration.
  devise_for :users, controllers: { registrations: 'registrations' }
  # Using UsersController and /users/* paths for profile viewing and editing.
  resources :users, only: [:show, :edit, :update]
  # Namespacing to the '/admin/users' path, to avoid conflicting with Devise.
  scope 'admin' do
    resources :users, only: [:index, :new, :create, :destroy]
  end

  scope 'superadmin' do
    resources :users, only: [:index, :new, :create, :destroy]
  end

  resources :partners, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show]
  resources :notes, only: [:index, :show, :show_images]

  namespace :admin do
    resources :partners do
      resources :notes 
    end
    resources :categories
    resources :products
    resources :notes
    resources :dietaries
    resources :procurements
  end

  namespace :superadmin do
    resources :partners do
      resources :notes 
    end
    resources :categories
    resources :products
    resources :notes
    resources :dietaries
    resources :procurements
  end

  namespace :api, constraints: { format: 'json' } do  
    namespace :v1 do
      defaults format: :json do
        resources :partners
      end
    end  
  end  

  get 'search', to: "partners#search"

  # get 'api/v1/partners', to: "api/v1/partners#index"
  # get 'api/v1/partners/:id', to: "api/v1/partners#show"
  get 'api/v1/regions', to: "api/v1/regions#index"
  get 'api/v1/category_groups', to: "api/v1/category_groups#index"
end