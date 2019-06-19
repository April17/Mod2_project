class ProjectsController < ApplicationController

  def new
    username = session[:user_username]
    if username.include?("mag")
      @manager = Manager.find_by(username: username)
      @project = Project.new
    else
      redirect_to employee_path(Employee.find_by(username: session[:user_username]))
    end
  end

  def create
    project = Project.create(project_params)
    redirect_to project
  end


end

def project_params
  params.require(:project).permit(:name, :description, :manager_id)
end
