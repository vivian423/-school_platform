class Parent < ApplicationRecord
  belongs_to :kid
  belongs_to :user

  has_noticed_notifications
  has_many :notifications, as: :recipient, dependent: :destroy
end
