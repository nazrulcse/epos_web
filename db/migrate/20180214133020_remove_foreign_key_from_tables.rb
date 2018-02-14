class RemoveForeignKeyFromTables < ActiveRecord::Migration
  def change
    remove_foreign_key :pos_customers_invoices, :departments
    remove_foreign_key :pos_customers_invoices, :employees
    remove_foreign_key :pos_customers_invoices, :customers


    remove_foreign_key :pos_customers_invoice_items, :departments
    remove_foreign_key :pos_customers_invoice_items, column: :invoice_id
    remove_foreign_key :pos_customers_invoice_items, column: :product_id

    remove_foreign_key :pos_customers_payments, :departments
    remove_foreign_key :pos_customers_payments, :employees
    remove_foreign_key :pos_customers_payments, column: :invoice_id
    remove_foreign_key :pos_customers_payments, :bank_accounts
    remove_foreign_key :pos_customers_payments, column: :collected_by_id
    remove_foreign_key :pos_customers_payments, column: :cashier_id
  end
end
