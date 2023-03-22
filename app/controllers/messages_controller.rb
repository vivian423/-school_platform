class MessagesController < ApplicationController

  def create
    # need to write code to create message, then authorize
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    authorize @message
    @message.chatroom = @chatroom
    @message.user = current_user
    @message.save
    ChatroomChannel.broadcast_to(
      @chatroom,
      render_to_string(
        partial: "messages/message",
        locals: { message: @message }
      )
    )
    head :ok # don't send a view, don't make them redirect
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
