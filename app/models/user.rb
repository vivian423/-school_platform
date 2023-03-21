class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :announcements, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :activities, dependent: :destroy

  has_many :messages
  has_many :chatrooms, through: :messages

  has_many :parents

  has_many :kids, through: :rooms
  has_many :children, through: :parents, source: :kid

  # is it possible to do through x2?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

# has_many :bookmarked_posts, through: :bookmarks, source: :post
