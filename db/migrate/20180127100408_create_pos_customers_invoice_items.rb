class CreatePosCustomersInvoiceItems < ActiveRecord::Migration
  def change
    create_table :pos_customers_invoice_items do |t|
      t.references :department, index: true, foreign_key: true
      t.references :invoice, references: :pos_customers_invoice, index: true
      t.references :product, references: :pos_product, index: true
      t.text :note
      t.float :cost_price
      t.float :sale_price
      t.float :whole_sale
      t.integer :quantity
      t.float :amount
      t.float :discount
      t.float :vat
      t.float :total
      t.text :attachment

      t.timestamps null: false
    end

    add_foreign_key :pos_customers_invoice_items, :pos_customers_invoices, column: :invoice_id
    add_foreign_key :pos_customers_invoice_items, :pos_products, column: :product_id
  end
end
