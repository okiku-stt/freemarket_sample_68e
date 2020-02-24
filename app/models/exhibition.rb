class Exhibition < ApplicationRecord
  belongs_to :user

  has_many :comments
  belongs_to :category
  belongs_to :image
  belongs_to :purchase

  validates :price, presence: true
  validates :shipping_date, presence: true
end
