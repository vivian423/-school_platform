class DashboardsController < ApplicationController

  def dashboard
    @activities = Activity.find_by(Date.today)
    @kid = current_user.parent.kid
  end

end
