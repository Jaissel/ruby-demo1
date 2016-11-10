Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :skip => [:registrations, :passwords], :path => "", :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "users/sessions"} do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

  namespace :api do
    resources :users, only: [:show, :update] do
      get :attendances
      get :attending
      get :not_attending
    end
    resources :industries, only: [:index] do
      get :areas
    end
    resources :areas, only: [:index]
    resources :industry_area_users, only: [:create]
    resources :events, only: [:index, :show]
    resources :attendances, only: [:destroy, :create]
    scope :search, :controller => 'search' do
      get :by_text
      get :by_areas
      get :by_industries
    end
  end
end
