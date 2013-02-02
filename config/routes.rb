Irails::Application.routes.draw do
  # TODO: enable after fixing issue loading in Rails 4
  # ActiveAdmin.routes(self)
  # devise_for :admin_users, ActiveAdmin::Devise.config

  mount Resque::Server.new, at: "/resque" if defined?(Resque)

  devise_for :users

  post '/stripe_listener' => 'subscription_events#stripe'

  resource :subscription, only: [:edit, :update] do
    get :card_details
  end

  root to: 'pages#show', id: 'home'
end