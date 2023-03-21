class Photo < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :kids, through: :tags

  has_one_attached :photo
end
