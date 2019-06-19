class EmployeesController < ApplicationController
  before_action :find_employee
  skip_before_action :authorized?, only: [:new, :create]
  def show
    if @employee.username == session[:user_username]
      @employeetasks = @employee.employee_tasks
      @coworkers = @employee.manager.employees - [@employee]
      @quote = Faker::Games::LeagueOfLegends.quote
    else
      redirect_to common_show_path(:username => @employee.username)
    end
  end

  def new
    @employee = Employee.new
  end

  def create
    # byebug
    params[:employee][:username] = "emp" << params[:employee][:username]
    employee = Employee.create(employee_params)
    redirect_to new_login_path
  end

  def employee_params
    params.require(:employee).permit(:name, :username, :password, :manager_id)
  end

end

def find_employee
  @employee = Employee.find_by(id: params[:id])
end
