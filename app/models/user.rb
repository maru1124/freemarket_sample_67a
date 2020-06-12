class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, confirmation: true
  devise :validatable, password_length: 7..128
  validates :first_name, :last_name, format: { with: /[^ -~｡-ﾟ]+/, message: "全角のみで入力して下さい" }
  validates :first_name_kana, :last_name_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい" }
  validates :nickname, :email, :encrypted_password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, presence: true

  has_many :commodities, dependent: :delete_all
  has_many :evaluations, dependent: :delete_all
  has_many :likes,       dependent: :delete_all
  has_many :like_posts, through: :likes, source: :post
  has_many :commodities, through: :likes
  has_many :comments,    dependent: :delete_all
  has_many :commodities, through: :comments
  has_many :exhibition_commodities, dependent: :delete_all
  has_many :commodities, through: :exhibition_commodities
  has_many :purchase_commodities, dependent: :delete_all
  has_many :commodities, through: :purchase_commodities
  has_one :address, dependent: :delete
  has_one :profile, dependent: :delete
end
