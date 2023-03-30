class MessagesController < ApplicationController

  def create
    # need to write code to create message, then authorize
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    authorize @message
    @message.chatroom = @chatroom
    @message.user = current_user
    @notifications = @message.chatroom.kid.parents[0].user.notifications
    # raise
    @message.save
    ChatroomChannel.broadcast_to(
      @chatroom,
      message: render_to_string(partial: "message", locals: { message: @message }),
      sender_id: @message.user.id
    )
    head :ok # don't send a view, don't make them redirect
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
