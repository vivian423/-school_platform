class Meeting < ApplicationRecord
  belongs_to :user

  validates :start_time, :end_time, presence: true
  validates :end_time, comparison: { greater_than: :start_time }
end
