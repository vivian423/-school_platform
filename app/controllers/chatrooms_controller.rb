class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(Chatroom)
    @chatroom = policy_scope(Chatroom).first
    @message = Message.new

    current_user.notifications.unread.each do |notification|
      notification.mark_as_read! if notification.params[:type] == "message"
    end
  end

  # def show
  #   @chatroom = policy_scope(Chatroom).first
  #   authorize @chatroom
  #   @message = Message.new
  # end
end
