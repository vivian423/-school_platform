class Photo < ApplicationRecord
  has_many :tags
  has_many :kids, through: :tags
end
