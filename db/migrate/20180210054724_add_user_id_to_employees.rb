class AddUserIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :user_id, :string
    add_index :employees, :user_id, unique: true
  end
end
