class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :wallpaper

  validates :user_id, presence: true
  validates :wallpaper_id, presence: true
  validates :text, presence: true, length: { in: 1..200 }
end
