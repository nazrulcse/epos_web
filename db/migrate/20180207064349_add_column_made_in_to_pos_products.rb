class AddColumnMadeInToPosProducts < ActiveRecord::Migration
  def change
    add_column :pos_products, :made_in, :string
    remove_column :pos_products, :expire_date
  end
end
