class Exhibition < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  # has_many :comments
  belongs_to :category, optional: true

  belongs_to_active_hash :prefecture
  validates :price,                      presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "入力してください" }
  validates :shipping_date,              presence: true
  validates :item_name,                  presence: true, length: { minimum: 1, maximum: 40, message: "入力してください" }
  validates :item_description,           presence: true, presence: true, length: { minimum: 1, maximum: 1000, message: "入力してください" }
  validates :category_id,                presence: true
  validates :item_status,                presence: true
  validates :shipping_charges,           presence: true
  validates :prefecture_id,              presence: true

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
