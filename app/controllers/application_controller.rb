class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find_by(:id => session[:user_id])
  end

  def validate_session
    if !current_user
      redirect_to root_path
    end
  end

  helper_method :current_user
  helper_method :validate_session

end
