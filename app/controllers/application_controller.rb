class ApplicationController < ActionController::Base
  before_action :find_user
  before_action :authorized?
  before_action :utility
  skip_before_action :authorized?, only: [:hello]

  def hello
    @quote = Faker::Games::LeagueOfLegends.quote
  end

  def utility
    @utility = Utility.new
  end

  def find_user
    @manager_check = false
    @user_username = session[:user_username]
    @logged_in = !!@user_username
    if @logged_in
      if @user_username[0..2] == "emp"
        @user = Employee.find_by(username: @user_username)
        @nve_bar_name = @user.name
        @home_path = Employee.find_by(username: @user_username)
        @edit_account_path = edit_employee_path(@user)
      elsif @user_username[0..2] == "mag"
        @manager_check = true
        @user = Manager.find_by(username: @user_username)
        @home_path = Manager.find_by(username: @user_username)
        @nve_bar_name = @user.name
        @edit_account_path = edit_manager_path(@user)
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
