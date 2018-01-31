class CreatePosSuppliersPurchaseItems < ActiveRecord::Migration
  def change
    create_table :pos_suppliers_purchase_items do |t|
      t.references :purchase, references: :pos_suppliers_purchase, index: true
      t.references :product, references: :pos_product, index: true
      t.float :old_cost_price
      t.float :old_sale_price
      t.float :old_whole_sale
      t.integer :issued_quantity
      t.references :department, index: true, foreign_key: true
      t.text :note
      t.boolean :is_received
      t.integer :received_quantity
      t.float :cost_price
      t.float :sale_price
      t.float :whole_sale
      t.float :amount
      t.float :discount
      t.float :vat
      t.float :total

      t.timestamps null: false
    end

    add_foreign_key :pos_suppliers_purchase_items, :pos_suppliers_purchases, column: :purchase_id
    add_foreign_key :pos_suppliers_purchase_items, :pos_products, column: :product_id
  end
end
