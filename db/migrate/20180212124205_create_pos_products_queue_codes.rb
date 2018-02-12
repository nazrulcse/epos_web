class CreatePosProductsQueueCodes < ActiveRecord::Migration
  def change
    create_table :pos_products_queue_codes do |t|
      t.references :department, index: true, foreign_key: true
      t.references :product, references: :pos_product, index: true
      t.integer :quantity

      t.timestamps null: false
    end

    add_foreign_key :pos_products_queue_codes, :pos_products, column: :product_id
  end
end
