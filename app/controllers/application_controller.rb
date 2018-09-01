class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :show_rated?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def show_rated?(show, user)
    !show.users.include?(user)
  end

  def authorize
    if current_user.nil?
      flash['card-panel red lighten-2 center-align'] = 'You must be logged in to access this page.'
      redirect_to login_path
    end
  end

  def admin_authorize
    if current_user.nil?
      flash['card-panel red lighten-2 center-align'] = 'You must be an administrator to access this page.'
      redirect_to login_path
    elsif !current_user.admin
      flash['card-panel red lighten-2 center-align'] = 'You must be an administrator to access this page.'
      redirect_to login_path
    end
  end
end
