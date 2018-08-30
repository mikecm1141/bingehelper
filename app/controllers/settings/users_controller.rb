class Settings::UsersController < ApplicationController
  before_action :authorize, only: %i[show edit update]

  def show
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    end
  end

  def edit
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    flash['card-panel green center-align'] = 'Password changed successfully.'
    redirect_to settings_user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
