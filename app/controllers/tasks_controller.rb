class TasksController < ApplicationController
  before_action :find_task, only: [:edit]

  def edit

  end

  def update
    @task.update(task_params)
    redirect_to @task.project
  end

end

def find_task
  @task = Task.find_by(id: params[:id])
end

def task_params
  params.require(:task).permit(:name, :total_working_time)
end
