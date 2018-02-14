class AddColumnInvoiceGlobalIdToPosCustomersInvoiceItems < ActiveRecord::Migration
  def change
    add_column :pos_customers_invoice_items, :global_id, :string
    add_column :pos_customers_invoice_items, :invoice_global_id, :string
  end
end
