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
    job_id = params[:id]
    # byebug
    user_id = current_user.id
    application = Job.find(job_id).applications.create(job_id: job_id,user_id: user_id)
    if application.save
      flash[:success] = "You Have Successfully Applied"
      redirect_to user_path(current_user)
    else
      flash[:error] = "You Failed at applying! You'll Never get hired!"
      redirect_to login_path
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

  def correct_user
      @job = current_user.jobs.find_by(id: params[:id])
      redirect_to root_url if @job.nil?
  end

  private

  def job_params
    params.require(:job).permit(:department, :title, :description, :requirements,:salary)
  end

end
