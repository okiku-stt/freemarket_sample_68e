class Address < ApplicationRecord
  validates :ship_family_name, presence: true,
  format: {
    with: /[^ -~｡-ﾟ]+/,
    message: "全角のみで入力して下さい"
  }
  validates :ship_last_name, presence: true,
  format: {
    with: /[^ -~｡-ﾟ]+/,
    message: "全角のみで入力して下さい"
  }
  validates :ship_j_family_name, presence: true,
  format: {
    with: /[^ -~｡-ﾟ]+/,
    message: "全角のみで入力して下さい"
  }
  validates :ship_j_last_name, presence: true,
  format: {
    with: /[^ -~｡-ﾟ]+/,
    message: "全角のみで入力して下さい"
  }
  validates :postal_code, presence: true
  validates :prefectures, presence: true
  validates :municipalities, presence: true
  validates :house_number, presence: true
  belongs_to :user

end
