class CreatePosCustomersCategories < ActiveRecord::Migration
  def change
    create_table :pos_customers_categories do |t|
      t.references :department, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
