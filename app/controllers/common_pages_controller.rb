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

end


