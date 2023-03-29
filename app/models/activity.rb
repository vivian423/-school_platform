class Activity < ApplicationRecord
  belongs_to :kid
  belongs_to :user
  has_noticed_notifications
end
