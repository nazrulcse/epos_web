class CreatePosProductsModels < ActiveRecord::Migration
  def change
    create_table :pos_products_models do |t|
      t.string :code
      t.references :department, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
