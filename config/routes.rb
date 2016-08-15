Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations, :passwords], :path => "", :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "users/sessions"} do
    get '/logout' => 'users/sessions#destroy', :as => :destroy_user_session
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

  namespace :api do
    resources :users, only: [:show]
    resources :industries, only: [:index] do
      get :areas
    end
    resources :industry_area_users, only: [:create]
    resources :events, only: [:index, :show]
  end
end
