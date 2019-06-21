class MailsController < ApplicationController

  def create
    return_path = Manager.find_by(username: session[:user_username])
    Mail.create(manager_message_params)
    redirect_to return_path
  end

end

def manager_message_params
  params.require(:manager_message).permit(:title, :content, :employee_id, :manager_id, :sender)
end
