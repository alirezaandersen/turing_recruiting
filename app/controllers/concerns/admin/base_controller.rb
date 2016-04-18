class AdminBaseController < ApplicationController
  before_action :require_admin

  def require_admin
    render _file: "/public/404" unless current_user.admin?
  end
end
