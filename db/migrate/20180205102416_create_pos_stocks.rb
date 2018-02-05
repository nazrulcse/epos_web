class CreatePosStocks < ActiveRecord::Migration
  def change
    create_table :pos_stocks do |t|
      t.integer :product_id
      t.integer :quantity
      t.string :stockable_id
      t.string :stockable_type
      t.string :location_id

      t.timestamps null: false
    end
  end
end
