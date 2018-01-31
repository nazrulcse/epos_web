class CreatePosCustomersInvoices < ActiveRecord::Migration
  def change
    create_table :pos_customers_invoices do |t|
      t.string :number
      t.date :date
      t.references :department, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.references :customer, references: :pos_customer, index: true
      t.text :note
      t.float :amount
      t.float :discount
      t.float :vat
      t.float :total
      t.text :attachment
      t.string :global_id

      t.timestamps null: false
    end

    add_foreign_key :pos_customers_invoices, :pos_customers, column: :customer_id
  end
end
