class Image < ApplicationRecord
  belongs_to :exhibition
  mount_uploader :image, ImageUploader
end
