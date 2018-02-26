class CreateExpensesSubCategories < ActiveRecord::Migration
  def change
    create_table :expenses_sub_categories do |t|
      t.integer :category_id
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
