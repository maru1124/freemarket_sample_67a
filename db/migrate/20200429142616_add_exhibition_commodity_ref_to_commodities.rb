class AddExhibitionCommodityRefToCommodities < ActiveRecord::Migration[5.2]
  def change
    add_reference :commodities, :exhibition_commodity, foreign_key: { to_table: :users }
  end
end
