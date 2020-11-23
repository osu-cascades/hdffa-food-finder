Rails.application.routes.draw do

  root 'partners#index'

  # Users
  # Using Devise RegistrationsController for public user creation/registration.
  devise_for :users, controllers: { registrations: 'registrations' }
  # Using UsersController and /users/* paths for profile viewing and editing.
  resources :users, only: [:show, :edit, :update]
  # Namespacing to the '/admin/users' path, to avoid conflicting with Devise.
  scope 'admin' do
    resources :users, only: [:index, :new, :create, :destroy]
  end

  resources :partners, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show]

  namespace :admin do
    resources :partners do
      resources :notes
    end
    resources :categories
    resources :products
  end

end
