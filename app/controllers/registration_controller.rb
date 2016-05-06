class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new secure_params

    if @user.save
      return redirect_to root_path,
        notice: t('.welcome', email: @user.email)
    end

    render :new
  end

  private
  def secure_params
    params.require(:user)
      .permit(:email, :password, :password_confirmation)
  end
end
