class EmployeesController < ApplicationController
  before_action :find_employee

  def show
    @employeetasks = @employee.employee_tasks
    @coworkers = @employee.manager.employees - [@employee]
    @quote = Faker::TvShows::GameOfThrones.quote
  end

end

def find_employee
  @employee = Employee.find_by(id: params[:id])
end
