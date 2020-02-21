class Exhibition < ApplicationRecord
  belongs_to :user
  has_many :comments
  belongs_to :category
  belongs_to :image
  belongs_to :purchase
  validates :price, presence: true
  validates :shipping_date, presence: true

  def self.search(search)
    if search
      Exhibition.where('item_name  LIKE(?)',"%#{search}%")
                            # ↑これがExhibitionテーブルにある該当するカラム名を引っ張ってこれる！
    else
      Exhibition.all
    end
  end
end
