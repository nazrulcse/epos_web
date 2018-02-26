class CreateExpensesCategories < ActiveRecord::Migration
  def change
    create_table :expenses_categories do |t|
      t.integer :department_id
      t.integer :group_id
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
