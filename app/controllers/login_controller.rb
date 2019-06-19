class LoginController < ApplicationController
  skip_before_action :authorized?, only: [:new, :create, :destroy]

  def new

  end

  def create
    account_type = params[:account]
    if account_type == "Employee"
      params[:username] = "emp" << params[:username]
      @user = Employee.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_username] = @user.username
        redirect_to @user
      else
        flash[:messages] = "Incorrect username or password!"
        redirect_to new_login_path
      end
    elsif account_type == "Manager"
      params[:username] = "mag" << params[:username]
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

  def destroy
    logout
    redirect_to :root
  end

end
