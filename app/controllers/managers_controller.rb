class ManagersController < ApplicationController
  before_action :find_manager, only: [:show]



  def show
    @quote = Faker::TvShows::GameOfThrones.quote
  end
end

def find_manager
  @manager = Manager.find(params[:id])
end
