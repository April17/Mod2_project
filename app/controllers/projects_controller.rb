class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :new, :update, :destroy]
  before_action :manager?, only: [:show, :new]

  def show
    @edit_check = false
    if @project.manager.username == session[:user_username]
      @edit_check = true
    end
    session[:project_id] = @project.id
    @employees = @project.manager.employees
    @tasks = @project.tasks
  end

  def new
    username = session[:user_username]
    if @manager_check
      @manager = Manager.find_by(username: username)
      @project = Project.new
    else
      redirect_to employee_path(Employee.find_by(username: session[:user_username]))
    end
  end

  def create
    project = Project.create(project_params(:name, :description, :manager_id))
    redirect_to project
  end

  def edit

  end

  def update
    @project.update(project_params(:name, :description))
    redirect_to @project
  end

  def destroy
    @project.destroy
    redirect_to @user
  end
end

def project_params(*argu)
  params.require(:project).permit(*argu)
end

def find_project
  @project = Project.find(params[:id])
  @quote = Faker::Movies::StarWars.quote
end
