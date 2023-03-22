class MessagesController < ApplicationController

  def create
    # need to write code to create message, then authorize
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    authorize @message
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      redirect_to chatroom_path(@chatroom)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
