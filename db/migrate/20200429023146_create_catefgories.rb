class CreateCatefgories < ActiveRecord::Migration[5.2]
  def change
    create_table :catefgories do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
