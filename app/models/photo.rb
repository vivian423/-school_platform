class Photo < ApplicationRecord
  has_many :tags
  has_many :kids, through: :tags

  has_one_attached :photo
end
