class Address < ApplicationRecord
  validates :post_number, :city, :town, presence: true

  belongs_to :user
end
