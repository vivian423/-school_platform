class Chatroom < ApplicationRecord
  belongs_to :kid
  has_many :messages
end
