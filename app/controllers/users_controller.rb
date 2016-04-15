class UsersController < ActionController::Base

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
    @user = User.create(user_params)
    if @user.save
      render :show
    else
      flash[:error] = "Missing Data"
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :user_name, :password_digest)
  end

end
