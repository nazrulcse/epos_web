class CreatePosCustomers < ActiveRecord::Migration
  def change
    create_table :pos_customers do |t|
      t.string :name
      t.string :company
      t.string :address
      t.string :city
      t.string :email
      t.string :mobile
      t.references :department, index: true, foreign_key: true
      t.float :initial_balance
      t.string :nid
      t.text :nid_image
      t.string :passport_no
      t.text :passport_image
      t.string :driving_licence
      t.text :driving_licence_image

      t.timestamps null: false
    end
  end
end
