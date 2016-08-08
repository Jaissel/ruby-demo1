Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "users/sessions"} do
    get '/logout' => 'users/sessions#destroy', :as => :destroy_user_session
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end
end
