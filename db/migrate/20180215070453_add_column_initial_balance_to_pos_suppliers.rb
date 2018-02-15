class AddColumnInitialBalanceToPosSuppliers < ActiveRecord::Migration
  def change
    add_column :pos_suppliers, :initial_balance, :double
    add_column :pos_suppliers, :initial_balance_date, :date
  end
end
