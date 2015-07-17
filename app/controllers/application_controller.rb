class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CurrentUser
  include JT::Rails::Meta


  def current_setting
    @setting = Setting.first
  end
  helper_method :current_setting
end
