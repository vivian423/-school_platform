class DashboardsController < ApplicationController
  def dashboard
    authorize @user
    @activities = Activity.find_by(Date.today)
    @kid = current_user.parent.kid
    @kids = current_user.children
    @activities = Activity.find_by(date: Date.today)
    @chatrooms = Chatroom.all
    @photos = Photo.all
    @events = Event.all
    @announcements = Announcement.all
  end
end
