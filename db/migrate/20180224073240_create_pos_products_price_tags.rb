class CreatePosProductsPriceTags < ActiveRecord::Migration
  def change
    create_table :pos_products_price_tags do |t|
      t.integer :department_id
      t.integer :product_id
      t.string :barcode
      t.float :cost_price
      t.float :sale_price
      t.float :whole_sale
      t.timestamps null: false
    end

    change_column :pos_products_price_tags, :cost_price, :double
    change_column :pos_products_price_tags, :sale_price, :double
    change_column :pos_products_price_tags, :whole_sale, :double
  end
end
