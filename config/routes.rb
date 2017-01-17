Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :skip => [:registrations], :path => "", :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "users/sessions", passwords: 'users/passwords'} do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end
  

  devise_scope :user do 
    post "/users/password/verify_code" => "users/passwords#verify_code"
  end

  namespace :api do
    post 'users/sign_in' => 'users#log_in'
    post 'users/reset_password' => "users#create_reset_password"
    resources :users, only: [:show, :update, :create] do
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
  match '/new_email' => 'api/users#new_email', :via => :get
  match '/termsandconditions' => 'main#termsandconditions', :via => :get

end
