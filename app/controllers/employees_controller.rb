class EmployeesController < ApplicationController
  before_action :find_employee
  skip_before_action :authorized?, only: [:new, :create, :destroy]
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
    employee = Employee.create(employee_params(:name, :username, :password, :manager_id))
    redirect_to new_login_path
  end

  def edit

  end

  def update
    if @employee.username == session[:user_username]
      return redirect_to @user
    end
    password = params[:employee][:password]
    password2 = params[:employee][:confirm_password]
    if @utility.double_chack_passowrd(password, password2)
      @employee.update(employee_params(:name, :password))
      redirect_to @employee
    else
      flash[:messages] = "Password is not match"
      redirect_to @edit_account_path
    end
  end

  def employee_params(*argu)
    params.require(:employee).permit(*argu)
  end

  def got_fired
    employee = Employee.find_by(id: params[:employee_id])
    employee.destroy
    redirect_to edit_employees_path(Manager.find_by(username: session[:user_username]))
  end

  def destroy
    @employee.destroy
    session[:user_username] = nil
    redirect_to "/"
  end
end

def find_employee
  @employee = Employee.find_by(id: params[:id])
  @quote = Faker::Games::LeagueOfLegends.quote
end
