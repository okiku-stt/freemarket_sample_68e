class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true,
            format: {
              with: /[^ -~｡-ﾟ]+/,
              message: "全角のみで入力して下さい"
            }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }}

  has_one :address
  accepts_nested_attributes_for :address
  has_many :pays
  has_many :exibitions
  has_one :purchase
end