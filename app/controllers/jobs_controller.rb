class JobsController < ApplicationController
  before_action :admin_user, only: [:new, :create]
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def apply
    if current_user.nil?
      redirect_to login_path
    else
      job = Job.find(params[:id])
      application = job.applications.create(user_id: current_user.id)
      if application.save
        flash[:success] = "You Have Successfully Applied"
        redirect_to user_path(current_user)
      else
        flash[:error] = "You Have Already Applied For This Job."
        redirect_to jobs_path(job)
      end
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "Job Has Been Created"
      redirect_to job_path(@job)
    else
      flash[:error] = "Missing Data"
      render :new
    end
  end

  private

  def correct_user
    @job = current_user.jobs.find_by(id: params[:id])
    redirect_to root_url if @job.nil?
  end

  def job_params
    params.require(:job).permit(:department, :title, :description, :requirements,:salary)
  end
end
