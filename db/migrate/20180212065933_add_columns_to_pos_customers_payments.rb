class AddColumnsToPosCustomersPayments < ActiveRecord::Migration
  def change
    add_column :pos_customers_payments, :value_date, :date
    add_column :pos_customers_payments, :cheque_number, :string
    add_column :pos_customers_payments, :bank_name, :string
    add_column :pos_customers_payments, :bank_branch, :string
    add_column :pos_customers_payments, :status, :boolean
    add_column :pos_customers_payments, :confirmed, :boolean
    add_column :pos_customers_payments, :is_collection, :boolean
    add_column :pos_customers_payments, :is_group, :boolean
    add_column :pos_customers_payments, :account_payable, :boolean
    add_column :pos_customers_payments, :commission, :float
    add_reference :pos_customers_payments, :bank_account, index: true, foreign_key: true
    add_reference :pos_customers_payments, :collected_by, index: true
    add_reference :pos_customers_payments, :cashier, index: true
    add_foreign_key :pos_customers_payments, :employees, column: :collected_by_id
    add_foreign_key :pos_customers_payments, :employees, column: :cashier_id
  end
end
