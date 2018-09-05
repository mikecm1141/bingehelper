class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def authorize
    if current_user.nil?
      flash['card-panel red lighten-2 center-align'] = 'You must be logged in to access this page.'
      redirect_to login_path
    end
  end
end
