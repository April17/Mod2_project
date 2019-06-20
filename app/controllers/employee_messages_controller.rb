class EmployeeMessagesController < ApplicationController

  def create
    return_path = Employee.find_by(username: session[:user_username])
    EmployeeMessage.create(employee_message_params)
    redirect_to return_path
  end

end

def employee_message_params
  params.require(:employee_message).permit(:title, :content, :sender_id, :receiver_id)
end
