class ApplicationController < ActionController::Base
  before_action :find_user
  before_action :authorized?
  before_action :utility
  skip_before_action :authorized?, only: [:hello]

  def hello

  end

  def utility
    @utility = Utility.new
  end

  def find_user
    @user_username = session[:user_username]
    @logged_in = !!@user_username
    if @logged_in
      if @user_username[0..2] == "emp"
        @home_path = Employee.find_by(username: @user_username)
      elsif @user_username[0..2] == "mag"
        @home_path = Manager.find_by(username: @user_username)
      end
    end
  end

  def authorized?
    unless @logged_in
      return redirect_to new_login_path
    end
  end

  def logout
    session[:user_username] = nil
  end

  def home_path_setter(user)
    @home_path = user
  end
end
