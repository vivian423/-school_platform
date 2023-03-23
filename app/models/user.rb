class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :announcements, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :activities, dependent: :destroy

  has_many :messages, dependent: :destroy
  has_many :chatrooms, through: :messages, dependent: :destroy

  has_many :parents, dependent: :destroy

  has_many :kids, through: :rooms, dependent: :destroy
  has_many :children, through: :parents, source: :kid, dependent: :destroy
  has_many :chatrooms, through: :children, dependent: :destroy
  # is it possible to do through x2?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

# has_many :bookmarked_posts, through: :bookmarks, source: :post
# user.chatrooms yay!
