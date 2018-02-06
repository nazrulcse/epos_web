class AddNewColumnsToPosProducts < ActiveRecord::Migration
  def change
    add_column :pos_products, :size, :string
    add_column :pos_products, :color, :string
    add_column :pos_products, :has_warranty, :boolean
    add_column :pos_products, :warranty, :string
    add_column :pos_products, :expire_date, :date
    add_column :pos_products, :has_vat, :boolean
    add_column :pos_products, :vat, :float
    add_column :pos_products, :discount, :float
  end
end
