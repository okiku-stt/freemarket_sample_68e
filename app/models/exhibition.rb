class Exhibition < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  # has_many :comments
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to_active_hash :prefecture

  validates :price, presence: true
  validates :shipping_date, presence: true
  enum deal: { sell: 0, SOLDOUT: 1 }  
  def self.search(search)
    if search
      Exhibition.where('item_name  LIKE(?)',"%#{search}%")
    # これがExhibitionテーブルにある該当するカラム名を引っ張ってこれる！
    else
      Exhibition.all
    end
  end
end
