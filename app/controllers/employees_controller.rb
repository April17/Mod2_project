class EmployeesController < ApplicationController
  before_action :find_employee

  def show
    # byebug
    if @employee.username == session[:user_username]
      @employeetasks = @employee.employee_tasks
      @coworkers = @employee.manager.employees - [@employee]
      @quote = Faker::Games::LeagueOfLegends.quote
    else
      redirect_to common_show_path(:username => @employee.username)
    end
  end

end

def find_employee
  @employee = Employee.find_by(id: params[:id])
end
