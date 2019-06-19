class LoginController < ApplicationController
  skip_before_action :authorized?, only: [:new, :create]
  def new

  end

  def create
    account_type = params[:account]
    if account_type == "Employee"
      @user = Employee.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_username] = @user.username
        redirect_to @user
      else
        flash[:messages] = "Incorrect username or password!"
        redirect_to new_login_path
      end
    elsif account_type == "Manager"
      @user = Manager.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_username] = @user.username
        redirect_to @user
      else
        flash[:messages] = "Incorrect username or password!"
        redirect_to new_login_path
      end
    end
  end

end
