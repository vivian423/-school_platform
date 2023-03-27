class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @kids = current_user.children
    # @photos = Photo.all
    @events = Event.all
  end
end
