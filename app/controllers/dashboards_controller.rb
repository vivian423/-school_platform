class DashboardsController < ApplicationController
  def dashboard
    @kids = current_user.children
    @activities = Activity.find_by(date: Date.today)
    @chatrooms = Chatroom.all
    @photos = Photo.all
    @events = Event.all
    @announcements = Announcement.all
  end
end
