class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :department_id
      t.integer :category_id
      t.integer :sub_category_id
      t.float :amount
      t.integer :created_by
      t.string :received_by
      t.date :date
      t.boolean :approve
      t.text :description
      t.text :image
      t.string :payment_method
      t.string :cheque_number
      t.string :bank_name
      t.string :bank_branch
      t.integer :bank_account_id
      t.boolean :prepaid_expense

      t.timestamps null: false
    end

    change_column :expenses, :amount, :double
  end
end
