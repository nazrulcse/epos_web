class ChangeSomeColumnsToPosCustomersInvoices < ActiveRecord::Migration
  def change
    rename_column :pos_customers_invoices, :amount, :invoice_total
    rename_column :pos_customers_invoices, :total, :net_total
    add_column :pos_customers_invoices, :is_paid, :boolean, default: false
  end
end
