class CreatePosSuppliersPayments < ActiveRecord::Migration
  def change
    create_table :pos_suppliers_payments do |t|
      t.references :department, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.references :purchase, references: :pos_suppliers_purchase, index: true
      t.references :supplier, references: :pos_supplier, index: true
      t.date :date
      t.string :payment_method
      t.text :note
      t.float :amount
      t.float :discount
      t.float :total
      t.string :transaction_token
      t.text :attachment

      t.timestamps null: false
    end

    add_foreign_key :pos_suppliers_payments, :pos_suppliers_purchases, column: :purchase_id
    add_foreign_key :pos_suppliers_payments, :pos_suppliers, column: :supplier_id
  end
end
