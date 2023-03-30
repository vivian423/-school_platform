class Activity < ApplicationRecord
  belongs_to :kid
  belongs_to :user
  has_noticed_notifications
  after_create_commit { broadcast_notifications }

  private

  def broadcast_notifications
    UserNotification.with(type: "activity").deliver(self.kid.parents[0].user)
    UserNotification.with(type: "activity").deliver(self.kid.parents[1].user)
  end
end
