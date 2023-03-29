class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @kids = current_user.children
    @photos = Photo.all
    @meetings = Meeting.all
    @chatrooom = Chatroom.find(@kids.first.chatroom_ids.join.to_i)
  end
end
