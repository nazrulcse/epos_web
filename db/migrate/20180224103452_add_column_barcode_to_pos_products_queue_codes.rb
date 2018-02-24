class AddColumnBarcodeToPosProductsQueueCodes < ActiveRecord::Migration
  def change
    add_column :pos_products_queue_codes, :barcode, :string
  end
end
