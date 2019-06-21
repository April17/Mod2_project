class ManagersController < ApplicationController
  before_action :find_manager, only: [:show]
  skip_before_action :authorized?, only: [:new, :create]

  def show
    if @manager.username == session[:user_username]
      @quote = Faker::TvShows::GameOfThrones.quote
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
    manager = Manager.create(manager_params)
    redirect_to new_login_path
  end

  def manager_params
    params.require(:manager).permit(:name, :username, :password)
  end
end

def find_manager
  @manager = Manager.find(params[:id])
end
