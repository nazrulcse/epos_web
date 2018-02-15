class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :company, index: true
      t.string :name
      t.string :email
      t.string :mobile
      t.string :code
      t.string :address
      t.float :point, default: 0.0
      t.float :last_point
      t.boolean :is_active, default: true

      t.timestamps null: false
    end

    change_column :members, :point, :double
    change_column :members, :last_point, :double
  end
end
