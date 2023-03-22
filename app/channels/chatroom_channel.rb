class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chatroom.find(params[:id])
    # stream_from "Max's chatroom"
    stream_for chatroom
  end

  def unsubscribed
    
    # Any cleanup needed when channel is unsubscribed
  end
end
