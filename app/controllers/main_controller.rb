class MainController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def termsandconditions

  end
end
