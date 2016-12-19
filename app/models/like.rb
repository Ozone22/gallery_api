class Like < ApplicationRecord
  belongs_to :wallpaper, counter_cache: true
  belongs_to :user

  validates :user_id, presence: true, uniqueness: { scope: :wallpaper_id }
  validates :wallpaper_id, presence: true
end
