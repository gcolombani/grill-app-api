Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  as :user do
    # Define routes for user within this block.
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :barbecues
  match 'my_barbecues' => 'barbecues#my_index', via: [:get]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
