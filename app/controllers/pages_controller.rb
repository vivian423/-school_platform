class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @photos = Photo.all
    @meetings = Meeting.all
    if current_user.teacher == false
      @kids = current_user.children
      # Hard coded to Max's chatroom
      @chatrooom = Chatroom.find(@kids.first.chatroom_ids.join.to_i)
    else
      @kids = current_user.kids
      # Hard coded to Max's chatroom
      @chatrooom = Chatroom.find(@kids.first.chatroom_ids.join.to_i)
    end

    @notifications = current_user.notifications
  end
end
