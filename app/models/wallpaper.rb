class Wallpaper < ApplicationRecord
  mount_uploader :image, ImageUploader

  before_destroy { remove_image! }

  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true, length: { in: 1..180 }
  validates :image, image: true
end
