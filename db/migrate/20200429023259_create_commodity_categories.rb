class CreateCommodityCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :commodity_categories do |t|
      t.timestamps
    end
  end
end
