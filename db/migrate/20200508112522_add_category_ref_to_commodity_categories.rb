class AddCategoryRefToCommodityCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :commodity_categories, :category, foreign_key: true
  end
end
