class AddColumnAdvancePaidToPosCustomersInvoices < ActiveRecord::Migration
  def change
    add_column :pos_customers_invoices, :advance_paid, :float
    add_column :pos_customers_invoices, :transport_cost, :float
  end
end
