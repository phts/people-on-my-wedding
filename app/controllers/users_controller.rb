class UsersController < ApplicationController
  # NOT WORKING: skip_before_action :authenticate_user, only: [:sing_in, :log_in, :log_out]
  before_action :authenticate_user, only: [:edit_password, :change_password, :reset_password]

  def sing_in
  end

  def log_in
    user = User.authenticate(user_params[:password])

    if user
      session[:user_id] = user.id
      redirect_to :root
    else
      render action: 'sign_in'
    end
  end

  def log_out
    session.delete(:user_id)
    redirect_to :sign_in
  end

  def edit_password
  end

  def change_password
    if current_user.change_password(user_params[:password], user_params[:new_password])
      redirect_to :root
    else
      render action: 'edit_password'
    end
  end

  def reset_password
    current_user.reset_password
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:password, :new_password)
  end

end
