class CommonPagesController < ApplicationController

  def show
    username = params[:username]
    if username[0..2] == "emp"
      @user = Employee.find_by(username: username)
      @quote = Faker::Games::LeagueOfLegends.quote
    elsif username[0..2] == "mag"
      @user = Manager.find_by(username: username)
      @quote = Faker::TvShows::GameOfThrones.quote
    end
  end

end
