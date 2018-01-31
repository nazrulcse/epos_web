class CreatePosCustomersPayments < ActiveRecord::Migration
  def change
    create_table :pos_customers_payments do |t|
      t.references :department, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.references :invoice, references: :pos_customers_invoice, index: true
      t.references :customer, references: :pos_customer, index: true
      t.date :date
      t.string :payment_method
      t.text :note
      t.float :amount
      t.float :discount
      t.float :total
      t.string :transaction_token
      t.text :attachment
      t.string :global_id

      t.timestamps null: false
    end

    add_foreign_key :pos_customers_payments, :pos_customers_invoices, column: :invoice_id
    add_foreign_key :pos_customers_payments, :pos_customers, column: :customer_id
  end
end
