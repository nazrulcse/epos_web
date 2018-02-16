class AddColumnsToPosSuppliersPayments < ActiveRecord::Migration
  def change
    add_column :pos_suppliers_payments, :value_date, :date
    add_column :pos_suppliers_payments, :cheque_number, :string
    add_column :pos_suppliers_payments, :bank_name, :string
    add_column :pos_suppliers_payments, :bank_branch, :string
    add_column :pos_suppliers_payments, :paid_to, :string
    add_column :pos_suppliers_payments, :status, :boolean, default: false
    add_column :pos_suppliers_payments, :confirmed, :boolean, default: false
    add_column :pos_suppliers_payments, :is_group, :boolean, default: false
    add_column :pos_suppliers_payments, :commission, :double
    add_reference :pos_suppliers_payments, :bank_account, index: true
    add_reference :pos_suppliers_payments, :paid_by, index: true
  end
end
