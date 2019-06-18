class ManagersController < ApplicationController

    def show
        @manager = Manager.find(params[:id])
    end
end
