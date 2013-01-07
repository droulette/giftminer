class DashboardController < ApplicationController
  before_filter :authenticate_user!
  def index
    @recs=current_user.recommendations
    @occassions=current_user.occassions
  end

end
