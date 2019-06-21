class ManagersController < ApplicationController
  before_action :find_manager, only: [:show, :edit, :update, :edit_employees, :destroy]
  skip_before_action :authorized?, only: [:new, :create]

  def show
    if @manager.username == session[:user_username]
      @message_list = @manager.employees
      @manager_messages = @manager.mails.select {|mail| mail.sender != @manager.username}
      @sent_messages = @manager.mails.select {|mail| mail.sender == @manager.username}

      if @manager.mails.length < 3
        @recent_three_messages = @manager.mails
      else
        @recent_three_messages = @manager.mails[-3..-1]
      end
    else
      redirect_to common_show_path(:username => @manager.username)
    end
  end

  def new
    @manager = Manager.new
  end

  def create
    # byebug
    params[:manager][:username] = "mag" << params[:manager][:username]
    manager = Manager.create(manager_params(:name, :username, :password))
    redirect_to new_login_path
  end

  def edit_employees
    if @manager.username == session[:user_username]
      @employees = @manager.employees
    else
      redirect_to @user
    end

  end

  def update
    if @manager.username == session[:user_username]
      return redirect_to @user
    end
    password = params[:manager][:password]
    password2 = params[:manager][:confirm_password]
    if @utility.double_chack_passowrd(password, password2)
      @manager.update(manager_params(:name, :password))
      redirect_to @manager
    else
      flash[:messages] = "Password is not match"
      redirect_to @edit_account_path
    end
  end
end


def find_manager
  @manager = Manager.find(params[:id])
  @quote = Faker::TvShows::GameOfThrones.quote
end

def manager_params(*argu)
  params.require(:manager).permit(*argu)
end
