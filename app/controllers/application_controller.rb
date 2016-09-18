class ApplicationController < ActionController::Base
  include ActionController::RespondWith
  include ActionView::Layouts

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  acts_as_token_authentication_handler_for User, fallback_to_devise: false
  before_filter :authenticate_user!, unless: :current_admin_user

  protected
    def record_not_found
      render  :success => false,
              :json => {
                        :info => "The record is not registered."
                      }
    end
end
