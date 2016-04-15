class UsersController < ActionController::Base

  def index
    @users = User.all
  end

  def new
    @new = User.new
  end

  def show
    @user = User.find(user_params)
  end


  private

  def user_params
    params.require(@user).permit(:user_name, :password)
  end

end
