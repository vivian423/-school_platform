class Photo < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :kids, through: :tags, dependent: :destroy

  has_one_attached :photo
  has_noticed_notifications
  after_create_commit { broadcast_notifications }

  private

  def broadcast_notifications
    User.all.each do |user|
      UserNotification.with(type: "photo").deliver(user) if user.teacher == false
    end

    # broadcast_prepend_to "notifications",
    #                       target: "notifications",
    #                       partial: "notifications/photo_notifications",
    #                       locals: { type: "message", unread: true }
  end
end
