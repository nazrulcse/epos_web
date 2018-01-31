class CreatePosSuppliersPurchases < ActiveRecord::Migration
  def change
    create_table :pos_suppliers_purchases do |t|
      t.string :code
      t.date :issue_date
      t.date :expected_delivery
      t.references :department, index: true, foreign_key: true
      t.references :issued_employee, references: :employee, index: true
      t.references :received_employee, references: :employee, index: true
      t.references :supplier, references: :pos_supplier, index: true
      t.text :instruction
      t.boolean :is_received
      t.date :receive_date
      t.float :amount
      t.float :discount
      t.float :vat
      t.float :total
      t.text :note
      t.text :attachment

      t.timestamps null: false
    end

    add_foreign_key :pos_suppliers_purchases, :pos_suppliers, column: :supplier_id
    add_foreign_key :pos_suppliers_purchases, :employees, column: :issued_employee_id
    add_foreign_key :pos_suppliers_purchases, :employees, column: :received_employee_id
  end
end
