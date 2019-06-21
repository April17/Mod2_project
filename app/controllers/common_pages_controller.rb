class CommonPagesController < ApplicationController

  def show
    username = params[:username]
    if username[0..2] == "emp"
      @user = Employee.find_by(username: username)
      @employeetasks = @user.employee_tasks
      @quote = Faker::Games::LeagueOfLegends.quote
      @coworkers = @user.manager.employees - [@user]
    elsif username[0..2] == "mag"
      @manager = Manager.find_by(username: username)
      @quote = Faker::TvShows::GameOfThrones.quote

      render template: "common_pages/mag_show"
    end
  end

  def message_redirect
    receiver = params[:employee_message][:receiver_id]
    if receiver[0..2] == "emp"
      return_path = Employee.find_by(username: session[:user_username])
      params[:employee_message][:receiver_id] = Employee.find_by(username: params[:employee_message][:receiver_id]).id
      EmployeeMessage.create(employee_message_params)
    elsif receiver[0..2] == "mag"
      return_path = Employee.find_by(username: session[:user_username])
      parm = params.require(:employee_message).permit(:title, :content, :sender)
      parm[:manager_id] = Manager.find_by(username: params[:employee_message][:receiver_id]).id.to_s
      parm[:employee_id] = params[:employee_message][:sender_id]
      Mail.create(parm)
    end
    redirect_to return_path
  end

end

def employee_message_params
  params.require(:employee_message).permit(:title, :content, :sender_id, :receiver_id)
end
