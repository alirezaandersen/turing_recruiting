class AdminController < ApplicationController
  def index
  end

  def jobs
  end

  def users
    @users = User.all
  end
end
