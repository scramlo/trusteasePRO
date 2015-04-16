class WorkersController < ApplicationController
  http_basic_authenticate_with name: "swc", password: "SpoWes1100"

  before_action :authenticate_trustee!

  def create
    @project = Project.find(params[:project_id])
    @worker = @project.workers.create(worker_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @worker = @project.workers.find(params[:id])
    @worker.destroy
    redirect_to project_path(@project)
  end

  private
  def worker_params
    params.require(:worker).permit(:name, :number, :email)
  end

end
