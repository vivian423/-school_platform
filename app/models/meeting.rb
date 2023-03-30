class Meeting < ApplicationRecord
  belongs_to :user

  validates :start_time, :end_time, presence: true
  validates :end_time, comparison: { greater_than: :start_time }

  has_noticed_notifications
  after_create_commit { broadcast_notifications }

  private

  def broadcast_notifications
    User.all.each do |user|
      UserNotification.with(type: "meeting").deliver(user) if user.teacher == false
    end
  end
end
