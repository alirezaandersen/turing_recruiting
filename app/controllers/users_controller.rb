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
  end

  def create
    @user = User.new(user_params)
    # byebug
    if @user.save
      login @user
      flash.now[:save] = "You have Successfully Register"
      render :show
    else
      flash.now[:error] = "Missing Data"
      render :new
    end
  end
  def edit

  end 
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:user_id])
    user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :user_name, :password)
  end

end
