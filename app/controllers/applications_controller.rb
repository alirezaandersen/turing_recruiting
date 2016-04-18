class ApplicationsController < ApplicationController

  def create
    @applications = Application.new()
  end

end
