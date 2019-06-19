class ApplicationController < ActionController::Base
  before_action :find_user
  before_action :authorized?
  before_action :utility

  def utility
    @utility = Utility.new
  end

  def find_user
    @user_username = session[:user_username]
    @logged_in = !!@user_username
  end

  def authorized?
    unless @logged_in
      return redirect_to new_login_path
    end
  end

  def home_path_setter(user)
    @home_path = user
  end
end
