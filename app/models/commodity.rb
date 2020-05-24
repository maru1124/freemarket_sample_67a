class Commodity < ApplicationRecord
  validates :name, :price, :day_to_ship, :shipping_method, presence: true

  belongs_to :brand
  belongs_to :sales_status
  belongs_to :postage
  belongs_to :shipping_charge
  has_many :images, dependent: :delete_all
  has_many :commodity_categories, dependent: :delete_all
  has_many :categories, through: :Commodity_categories
  has_many :likes, dependent: :delete_all
  has_many :users, through: :likes
  has_many :comments, dependent: :delete_all
  has_many :users, through: :comments
  belongs_to :exhibition_commodity, class_name: "User"
  belongs_to :purchase_commodity, class_name: "User"
end
