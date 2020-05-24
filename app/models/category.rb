class Category < ApplicationRecord
  validates :name, presence: true

  has_many :commodity_categories
  has_many :commodities, through: :commodity_categories
end
