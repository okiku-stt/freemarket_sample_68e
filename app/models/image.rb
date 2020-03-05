class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :exhibition
  validates :image,          presence: true
end
