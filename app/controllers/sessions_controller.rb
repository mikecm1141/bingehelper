class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:login][:email].downcase)

    if user && user.authenticate(params[:login][:password])
      session[:user_id] = user.id.to_s
      flash['card-panel green center-align'] = 'Login successful.'
      redirect_to root_path
    else
      flash.now['card-panel red lighten-2 center-align'] = 'Incorrect email or password, try again.'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash['card-panel green center-align'] = 'Logged out.'
    redirect_to login_path
  end
end
