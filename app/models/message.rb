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
      UserNotification.with(content: self.content).deliver(self.chatroom.kid.parents[0].user)
    else
      UserNotification.with(content: self.content).deliver(self.chatroom.kid.rooms[0].user)
    end

    # p user
    # p self
    # p self.chatroom.kid.parents[0]
    # p "----------------------------------------"
    # p act.kid.parents[0]

  end
end
