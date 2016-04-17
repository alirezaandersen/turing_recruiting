class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    # byebug
    if @user && @user.authenticate(params[:session][:password])
      login @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to @user
    else
      flash.now[:danger] = "Invalid Email and/or Password"
      render :new
    end
  end

  def destroy
    log_out if login?
      redirect_to root_url
      # byebug 
  end

end
