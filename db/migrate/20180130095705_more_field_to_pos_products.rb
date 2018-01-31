class MoreFieldToPosProducts < ActiveRecord::Migration
  def change
    add_column :pos_products, :supplier_id, :integer
    add_column :pos_products, :unit, :string
  end
end
