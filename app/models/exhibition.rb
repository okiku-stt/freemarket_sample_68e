class Exhibition < ApplicationRecord
  belongs_to :user
  # has_many :comments
  # belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  # belongs_to :purchase
  validates :price, presence: true
  validates :shipping_date, presence: true
end
