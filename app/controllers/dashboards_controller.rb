class DashboardsController < ApplicationController

  def dashboard
    authorize @user
    @activities = Activity.find_by(Date.today)
    @kid = current_user.parent.kid
  end

end
