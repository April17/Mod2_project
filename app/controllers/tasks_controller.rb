class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :new, :destroy]

  def new
    @amount = params[:amount].to_i
    @task = Task.new
    @project_id = session[:project_id]
    @employees = Manager.find_by(username: session[:user_username]).employees
    @quote = Faker::Movies::StarWars.quote
  end

  def create
    tasks_array = create_task_params
    for i in 0...tasks_array.length do
      @task = Task.create(tasks_array[i])
      employee_id_new = params[:tasks][i][:employee_ids].reject { |c| c.empty?}
      employee_id_new = employee_id_new.map{|id| id.to_i}
      employee_id_old = @task.employee_tasks.map{|et| et.employee_id}
      @task.add_employee(employee_id_new, employee_id_old)
    end
    redirect_to @task.project
  end

  def edit
    @employees = @task.project.manager.employees
    @quote = Faker::Movies::StarWars.quote
  end

  def update
    # byebug
    @task.update(task_params)
    employee_id_new = params[:task][:employee_ids].reject { |c| c.empty?}
    employee_id_new = employee_id_new.map{|id| id.to_i}
    employee_id_old = @task.employee_tasks.map{|et| et.employee_id}
    @task.add_employee(employee_id_new, employee_id_old)
    @task.cancel_task(employee_id_new, employee_id_old)
    redirect_to @task.project
  end

  def destroy
    project_path = @task.project
    @task.destroy
    redirect_to project_path
  end

end

def find_task
  @task = Task.find_by(id: params[:id])
end

def task_params
  params.require(:task).permit(:name, :total_working_time)
end

def create_task_params
  params.require(:tasks).map {|param| param.permit(:name, :total_working_time, :project_id)}
end
