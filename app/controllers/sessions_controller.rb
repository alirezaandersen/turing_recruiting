class SessionsController < ApplicationController

  def create
    @user = User.find_by(:user_name: params[:session][:user_name])
    if @user && @user.authenticate(params[:session][:password_digest])
      session[:user_id] = @user_id
      redirect_to @user
    else
      flash.now[:error] = "Invalid Username and/or Password"
      render :new
    end 
  end

end
