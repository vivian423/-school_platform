class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(Chatroom)
    @chatroom = policy_scope(Chatroom).first
    @message = Message.new
  end

  # def show
  #   @chatroom = policy_scope(Chatroom).first
  #   authorize @chatroom
  #   @message = Message.new
  # end
end
