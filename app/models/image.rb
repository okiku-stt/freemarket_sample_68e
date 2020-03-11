class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :exhibition
  # validates :image,          presence: true
  # まだ挙動確認中のため残しておく
end
