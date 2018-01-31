class CreatePosProducts < ActiveRecord::Migration
  def change
    create_table :pos_products do |t|
      t.string :code
      t.string :barcode
      t.string :name
      t.text :description
      t.references :department, index: true, foreign_key: true
      t.references :category, references: :pos_products_category, index: true
      t.references :sub_category, references: :pos_products_sub_category, index: true
      t.references :model, references: :pos_products_model, index: true
      t.references :brand, references: :pos_products_brand, index: true
      t.integer :re_order_level, default: 0
      t.float :cost_price, default: 0.0
      t.float :sale_price, default: 0.0
      t.float :whole_sale, default: 0.0
      t.boolean :expirable, default: false
      t.boolean :discountable, default: false
      t.integer :stock, default: 0
      t.boolean :is_active, default: true

      t.timestamps null: false
    end

    add_foreign_key :pos_products, :pos_products_categories, column: :category_id
    add_foreign_key :pos_products, :pos_products_sub_categories, column: :sub_category_id
    add_foreign_key :pos_products, :pos_products_models, column: :model_id
    add_foreign_key :pos_products, :pos_products_brands, column: :brand_id
  end
end
