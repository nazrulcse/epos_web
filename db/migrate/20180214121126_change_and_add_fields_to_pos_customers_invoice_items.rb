class ChangeAndAddFieldsToPosCustomersInvoiceItems < ActiveRecord::Migration
  def change
    add_column :pos_customers_invoice_items, :name, :string
    add_column :pos_customers_invoice_items, :unit, :string
    add_column :pos_customers_invoice_items, :date, :date
    rename_column :pos_customers_invoice_items, :sale_price, :price
  end
end
