class EmployeesController < ApplicationController
  before_action :find_employee
  skip_before_action :authorized?, only: [:new, :create]
  def show
    if @employee.username == session[:user_username]
      @employeetasks = @employee.employee_tasks

      @employee_messages = @employee.received_employee_messages
      @employee_manager_messages = @employee.mails.select {|mail| mail.sender != @employee.username}
      @employee_sent_messages = @employee.sent_employee_messages
      @employee_sent_manager_messages = @employee.mails.select {|mail| mail.sender == @employee.username}

      @coworkers = @employee.manager.employees - [@employee]
      message_list_temp = @employee.manager.employees - [@employee]
      @message_list = message_list_temp
      @message_list << @employee.manager
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
