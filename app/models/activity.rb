class Activity < ApplicationRecord
  belongs_to :kid
  belongs_to :user
  has_noticed_notifications
  after_create_commit { broadcast_notifications }

  private

  def broadcast_notifications
    UserNotification.with(type: "activity").deliver(self.kid.parents[0].user)
    UserNotification.with(type: "activity").deliver(self.kid.parents[1].user)

    # broadcast_prepend_to "notifications",
    #                         target: "notifications",
    #                         partial: "notifications/message_notifications",
    #                         locals: { type: "message", user: self.kid.parents[0].user, unread: true }
  end
end
