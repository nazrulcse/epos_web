class CreatePosSuppliers < ActiveRecord::Migration
  def change
    create_table :pos_suppliers do |t|
      t.string :name
      t.string :company
      t.string :address
      t.string :city
      t.string :email
      t.string :mobile
      t.references :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
