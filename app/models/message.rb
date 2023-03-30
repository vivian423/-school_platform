class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  has_noticed_notifications
  after_create_commit { broadcast_notifications }

  def sender?(a_user)
    user.id == a_user.id
  end

  private

  def broadcast_notifications
    if user.teacher
      UserNotification.with(type: "message").deliver(self.chatroom.kid.parents[0].user)
      UserNotification.with(type: "message").deliver(self.chatroom.kid.parents[1].user)
    else
      UserNotification.with(type: "message").deliver(self.chatroom.kid.rooms[0].user)
    end

    broadcast_prepend_to "notifications",
                          target: "notifications",
                          partial: "notifications/message_notifications",
                          locals: { type: "message", user: self.chatroom.kid.parents[0].user, unread: true }
  end
end
