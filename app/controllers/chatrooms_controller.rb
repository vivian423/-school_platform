class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(Chatroom)
    @chatroom = policy_scope(Chatroom).first
    @message = Message.new
    current_user.notifications.where(params[:type] == "message").mark_as_read!
  end

  # def show
  #   @chatroom = policy_scope(Chatroom).first
  #   authorize @chatroom
  #   @message = Message.new
  # end
end
