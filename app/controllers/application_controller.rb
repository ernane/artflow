class ApplicationController < ActionController::Base
  protect_from_forgery

  # NOTE: We stub out the current user of the application so that you
  # can easily run the example code discussed in the chapters.
  #
  # In a real, full fledged application we'd remove this and authenticate
  # using Devise, etc.
  def current_user
    Designer.first
  end
  helper_method :current_user

  def authenticate_user!
  end

  # NOTE: We stub out this personal preference so creation thumbnails
  # are expanded 
  before_filter :set_expanded_view
  def set_expanded_view
    session[:view] = 'expanded'
  end
  
end
