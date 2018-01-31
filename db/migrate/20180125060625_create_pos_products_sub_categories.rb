class CreatePosProductsSubCategories < ActiveRecord::Migration
  def change
    create_table :pos_products_sub_categories do |t|
      t.string :code
      t.references :department, index: true, foreign_key: true
      t.references :category, references: :pos_products_category, index: true
      t.string :name
      t.text :description
      t.boolean :is_active, default: true

      t.timestamps null: false
    end

    add_foreign_key :pos_products_sub_categories, :pos_products_categories, column: :category_id
  end
end
