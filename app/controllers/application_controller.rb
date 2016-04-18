class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include SessionsHelper
  before_action :is_admin?
  # before_action  :jobs, only: [:new]

  protect_from_forgery with: :exception



end
