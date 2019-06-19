class EmployeeTasksController < ApplicationController
  before_action :find_et

  def edit

  end

  def update
    @et.update(employee_task_params)
    redirect_to @et.employee
  end

end

def find_et
  @et = EmployeeTask.find_by(id: params[:id])
end

def employee_task_params
  params.require(:employee_task).permit(:hours_done)
end
