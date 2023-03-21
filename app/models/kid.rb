class Kid < ApplicationRecord
  has_many :photos, through: :tags, dependent: :destroy
  has_many :parents, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :activities, dependent: :destroy
end
