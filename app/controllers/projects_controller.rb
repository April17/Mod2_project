class ProjectsController < ApplicationController
  before_action :find_project, only: [:show]
  before_action :manager?, only: [:show, :new]

  def show
    session[:project_id] = @project.id
    @quote = Faker::Movies::StarWars.quote
    @employees = @project.manager.employees
    @tasks = @project.tasks
  end

  def new
    username = session[:user_username]
    if manager?
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

def find_project
  @project = Project.find(params[:id])
end

def manager?
  username = session[:user_username]
  username.include?("mag")
end
