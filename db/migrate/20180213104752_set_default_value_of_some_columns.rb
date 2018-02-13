class SetDefaultValueOfSomeColumns < ActiveRecord::Migration
  def change
    add_column :pos_customers, :is_active, :boolean, default: true
    add_column :pos_customers_invoices, :is_credit, :boolean, default: false
    add_column :pos_customers_invoices, :is_advance, :boolean, default: false
    add_column :pos_customers_invoices, :is_complete, :boolean, default: false
    change_column :pos_customers_payments, :status, :string
    change_column_default :pos_customers_payments, :confirmed, false
    change_column_default :pos_customers_payments, :is_collection, false
    change_column_default :pos_customers_payments, :is_group, false
    change_column_default :pos_customers_payments, :account_payable, false
    add_column :pos_suppliers, :is_active, :boolean, default: true
    change_column_default :pos_suppliers_purchases, :is_received, false
    change_column_default :pos_suppliers_purchase_items, :is_received, false
  end
end
