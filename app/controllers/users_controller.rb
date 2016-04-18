class UsersController < ApplicationController

  # before_action :is_admin?

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
    @all_user_jobs = User.find(current_user).jobs
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      flash.now[:save] = "You have Successfully Register"
      redirect_to user_path(@user)
    else
      flash.now[:error] = "Missing Data"
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes!(application_params)
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

  def application_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :address, :current_job, :previous_job)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
