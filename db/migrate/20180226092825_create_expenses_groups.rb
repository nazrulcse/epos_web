class CreateExpensesGroups < ActiveRecord::Migration
  def change
    create_table :expenses_groups do |t|
      t.integer :department_id
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
