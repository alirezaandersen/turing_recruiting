class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])

  end

  def new
    @job = Job.new
  end

  def create
    @job - Job.new(job_params)
    if @job.save = "Job Has Been Created"
      redirect_to job_path(@job)
    else
      flash[:error] = "Missing Data"
      render :new
    end
  end

  private

  def job_params
    params.require(@job).permit(:department, :title, :description, :requirements,:salary)
  end

end
