class DashboardController < ApplicationController
  def index
    @recs=current_user.recommendations
  end
end
