class AdminController < ApplicationController
  def index
  end

  def jobs
    #adding user functionality will allow for jobs to be searched by admin
  end

  def users
    @users = User.all
  end
end
