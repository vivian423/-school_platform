class MessagesController < ApplicationController

  def create
    # need to write code to create message, then authorize
    authorize @message
  end

end
