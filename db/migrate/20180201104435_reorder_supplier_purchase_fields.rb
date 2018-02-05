class ReorderSupplierPurchaseFields < ActiveRecord::Migration
  def change
    remove_column :pos_suppliers_purchase_items, :old_cost_price
    remove_column :pos_suppliers_purchase_items, :old_sale_price
    remove_column :pos_suppliers_purchase_items, :old_whole_sale
  end
end
