class Kid < ApplicationRecord
  has_many :photos, through: :tags
  has_many :parents
  has_many :rooms
  has_many :activities
end
