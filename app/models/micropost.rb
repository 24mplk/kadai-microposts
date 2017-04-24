class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :likeds, through: :reverses_of_favorite, source: :user
  
def feed_likings
  Liking.where(user_id: self.liking_ids + [self.id])
end

end