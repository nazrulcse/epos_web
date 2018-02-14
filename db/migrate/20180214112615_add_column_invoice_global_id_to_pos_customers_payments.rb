class AddColumnInvoiceGlobalIdToPosCustomersPayments < ActiveRecord::Migration
  def change
    add_column :pos_customers_payments, :invoice_global_id, :string
  end
end
