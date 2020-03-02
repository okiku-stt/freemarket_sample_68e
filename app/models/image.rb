class Image < ApplicationRecord
  belongs_to :exhibition
  mount_uploader :image, ImageUploader
  validates :image,          presence: true
end
