class AddColumnIsCompleteToPosSuppliersPurchases < ActiveRecord::Migration
  def change
    add_column :pos_suppliers_purchases, :transport_cost, :double, default: 0.0
    add_column :pos_suppliers_purchases, :is_complete, :boolean, default: false
  end
end
