class ChangeColumnTypeFloatToDouble < ActiveRecord::Migration
  def change
    change_column :bank_accounts, :balance, :double
    change_column :changed_settings, :working_hours, :double
    change_column :employees, :basic_salary, :double
    change_column :features, :cost, :double
    change_column :pos_customers, :initial_balance, :double
    change_column :pos_customers, :credit_limit, :double
    change_column :pos_customers_invoices, :invoice_total, :double
    change_column :pos_customers_invoices, :discount, :double
    change_column :pos_customers_invoices, :vat, :double
    change_column :pos_customers_invoices, :net_total, :double
    change_column :pos_customers_invoices, :advance_paid, :double
    change_column :pos_customers_invoices, :transport_cost, :double
    change_column :pos_customers_invoice_items, :cost_price, :double
    change_column :pos_customers_invoice_items, :price, :double
    change_column :pos_customers_invoice_items, :whole_sale, :double
    change_column :pos_customers_invoice_items, :amount, :double
    change_column :pos_customers_invoice_items, :discount, :double
    change_column :pos_customers_invoice_items, :vat, :double
    change_column :pos_customers_invoice_items, :total, :double
    change_column :pos_customers_payments, :amount, :double
    change_column :pos_customers_payments, :discount, :double
    change_column :pos_customers_payments, :total, :double
    change_column :pos_customers_payments, :commission, :double
    change_column :pos_products, :cost_price, :double
    change_column :pos_products, :sale_price, :double
    change_column :pos_products, :whole_sale, :double
    change_column :pos_products, :vat, :double
    change_column :pos_products, :discount, :double
    change_column :pos_suppliers_payments, :amount, :double
    change_column :pos_suppliers_payments, :discount, :double
    change_column :pos_suppliers_payments, :total, :double
    change_column :pos_suppliers_purchases, :amount, :double
    change_column :pos_suppliers_purchases, :discount, :double
    change_column :pos_suppliers_purchases, :vat, :double
    change_column :pos_suppliers_purchases, :total, :double
    change_column :pos_suppliers_purchase_items, :cost_price, :double
    change_column :pos_suppliers_purchase_items, :sale_price, :double
    change_column :pos_suppliers_purchase_items, :whole_sale, :double
    change_column :pos_suppliers_purchase_items, :amount, :double
    change_column :pos_suppliers_purchase_items, :discount, :double
    change_column :pos_suppliers_purchase_items, :vat, :double
    change_column :pos_suppliers_purchase_items, :total, :double

  end
end
