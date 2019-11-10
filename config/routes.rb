Rails.application.routes.draw do
  resources :payments
  devise_for :customers, path: 'customers', controllers: {registrations: "customers/registrations", sessions: "customers/sessions"}
  devise_for :admins, path: 'admins', controllers: {sessions: "admins/sessions"}

# devise_scope :admin do
#   get 'sign_in' => 'admins/sessions#new'
#   post 'sign_in' => 'admins/sessions#create'
#   delete 'sign_out' => 'admins/sessions#destroy'
#   get 'home' => 'demo#admin', as: :admins_home
# end

# devise_scope :customer do
#   get 'sign_in' => 'customers/sessions#new'
#   post 'sign_in' => 'customers/sessions#create'
#   delete 'sign_out' => 'customers/sessions#destroy'
#   get 'sign_up' => 'customers/registrations#new'
#   post '/' => 'customers/registrations#create'
# end

  get "/cars/all", to: "cars#index", as: "all_cars"
  delete "/cars", to: "cars#destroy"
  post "/cars", to: "cars#create"

  get "/customers/all", to: "customers/index#index", as: "all_customers"

  get "/bookings/all", to: "bookings#index", as: "all_bookings"
  get "/bookings", to: "bookings#new", as: "new_bookings"
  post "/bookings", to: "bookings#create"
  delete "/bookings", to: "bookings#destroy", as: "destroy_bookings"

  root to: 'demo#index'
end
