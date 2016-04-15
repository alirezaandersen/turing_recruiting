class UsersController < ApplicationController
  # layout "application"

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
    # byebug
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:save] = "You have Successfully Register"
      render :show
    else
      flash.now[:error] = "Missing Data"
      render :new
    end

    #call me back
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :user_name, :password_digest)
  end

end
