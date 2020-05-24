class CreateCommodities < ActiveRecord::Migration[5.2]
  def change
    create_table :commodities do |t|
      t.string :name,            null: false
      t.string :price,           null: false
      t.text :text,              null: false
      t.string :clothe
      t.string :condition,       null: false
      t.string :day_to_ship,     null: false
      t.string :shipping_method, null: false
      # t.references :exhibition_commodity, null: false, foreign_key: true
      # t.references :purchase_commodity,   null: false, foreign_key: true
      t.references :brand,                null: false, foreign_key: true
      # t.references :shipping_charge,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
