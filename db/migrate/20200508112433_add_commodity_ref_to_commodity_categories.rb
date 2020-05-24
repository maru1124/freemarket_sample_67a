class AddCommodityRefToCommodityCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :commodity_categories, :commodity, foreign_key: true
  end
end
