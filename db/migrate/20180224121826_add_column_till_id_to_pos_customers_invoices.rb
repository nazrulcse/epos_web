class AddColumnTillIdToPosCustomersInvoices < ActiveRecord::Migration
  def change
    add_column :pos_customers_invoices, :till_id, :string
  end
end
