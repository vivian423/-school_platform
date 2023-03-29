class Kid < ApplicationRecord
  has_many :chatrooms, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :photos, through: :tags, dependent: :destroy
  has_many :parents, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :activities, dependent: :destroy

  has_one_attached :photo
end
