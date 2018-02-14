class RemoveForeignKeyFromTables < ActiveRecord::Migration
  def change
    remove_foreign_key :pos_customers_invoices, :departments
    remove_foreign_key :pos_customers_invoices, :employees
    remove_foreign_key :pos_customers_invoices, :customers


    remove_foreign_key :pos_customers_invoice_items, :departments
    remove_foreign_key :pos_customers_invoice_items, :pos_customers_invoices
    remove_foreign_key :pos_customers_invoice_items, :pos_customers_invoices
    remove_foreign_key :pos_customers_invoice_items, :departments
    remove_foreign_key :pos_customers_invoice_items, :departments
  end
end
