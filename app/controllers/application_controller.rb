class ApplicationController < ActionController::Base
  before_action :utility

  def utility
    @utility = Utility.new
  end

end
