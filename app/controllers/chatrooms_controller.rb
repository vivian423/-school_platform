class ChatroomsController < ApplicationController

  # def index
  #   @chatrooms = Chatroom.policy_scope
  #   if current_user.teacher?
  #     @kid_chatrooms = current_user.kids.chatroom
  #   else
  #     @kid_chatrooms = current_user.children.chatroom
  #   end
  #   raise
  # end

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @message = Message.new
  end
end
