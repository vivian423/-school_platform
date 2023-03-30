class MeetingsController < ApplicationController

  def index
    @meetings = policy_scope(Meeting)
    start_date = params.fetch(:start_date, Date.today).to_date
    current_user.notifications.where(params[:type] == "meeting").mark_as_read!

    @meetings = Meeting.where(start_time:
      start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end
end
